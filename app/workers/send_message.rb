# For Background Jobs
class SendMessage
  include Sidekiq::Worker

  def perform(patient_id)
    appointment = Appointment.where(patient_id: patient_id, status: 'Approved')
    filter_appointment =  appointment.map { |app| { 'Schedule' => app['schedule'], 'Room' => app['room'] } }
    recepient_email = Patient.find(patient_id).email_id
    email = SendMessage.prepare_email(recepient_email, filter_appointment)
    email.deliver!
  end

  def self.prepare_email(recepient_email, filter_appointment)
    Mail.defaults do
      delivery_method :smtp, Rails.configuration.action_mailer.smtp_settings
    end
    mail = Mail.new do
      to recepient_email
      from 'do-not-reply@hims.com'
      subject 'Appointment Schedule'
      body filter_appointment
    end
    mail
  end
end
