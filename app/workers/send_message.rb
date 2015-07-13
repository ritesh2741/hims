# For Background Jobs
class SendMessage
  include Sidekiq::Worker

  def perform(patient_id, attachment_path)
    appointment = Appointment.where(patient_id: patient_id, status: 'Approved')
    filter_appointment =  appointment.map { |app| { 'Schedule' => app['schedule'], 'Room' => app['room'] } }
    recepient_email = Patient.find(patient_id).email_id
    email = SendMessage.prepare_email(recepient_email, filter_appointment, attachment_path)
    email.deliver!
    File.delete(attachment_path) unless attachment_path.empty?
  end

  def self.prepare_email(recepient_email, filter_appointment, attachment_path)
    Mail.defaults do
      delivery_method :smtp, Rails.configuration.action_mailer.smtp_settings
    end
    mail = Mail.new do
      to recepient_email
      from 'do-not-reply@hims.com'
      subject 'Appointment Schedule'
      body filter_appointment
    end
    mail.add_file(attachment_path) unless attachment_path.empty?
    mail
  end
end
