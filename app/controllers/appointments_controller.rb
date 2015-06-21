class AppointmentsController < ApplicationController
	def index
		@doctor = Doctor.find(params[:doctor_id])
		@appointments = @doctor.appointments
	end
end