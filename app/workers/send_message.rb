class SendMessage
	include Sidekiq::Worker

		def perform(patient_id)
      reports = Report.where(patient_id: patient_id)
      appointments =  Appointment.where(patient_id: patient_id)
      message_for_report = []
      message_for_appointment = []
      reports.each do |report|
         message_for_report << report.slice(:detail, :prescription)
      end
      appointments.each do |appointment|
         message_for_appointment << appointment.slice(:schedule, :room)
      end
		end
end