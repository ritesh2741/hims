# Sidekiq Class SendMessage
class SendMessage
  include Sidekiq::Worker

  def perform(patient_id)
    appointment = Appointment.where(patient_id: patient_id)
    appointment = appointment.where(status: 'Approved')
    filter_appointment =  appointment.map { |app| { 'Schedule' => app['schedule'], 'Room' => app['room'] } }
    recepient_email = Patient.find(patient_id).email_id
    options = { address: 'smtp.gmail.com',
                port: 587,
                domain: 'your.host.name',
                user_name: '<username>',
                password: '<password>',
                authentication: 'plain',
                enable_starttls_auto: true  }
    SendMessage.deliver(patient_id, filter_appointment)
  end

  def self.deliver(patient_id, filter_appointment)
    recepient_email = Patient.find(patient_id).email_id
    Mail.defaults do
      delivery_method :smtp, options
    end
    Mail.deliver do
      to recepient_email
      from 'do-not-reply@hims.com'
      subject 'Appointment Schedule'
      body filter_appointment
    end
  end
end
