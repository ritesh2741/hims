class AppointmentsController < ApplicationController
	load_and_authorize_resource
	def index
		@appointments = Appointment.all
	end

	def new
		@patient = Patient.all
		@doctor = Doctor.all
		@appointment = Appointment.new
	end

	def create
		modified_params= appointment_params.merge(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
		@appointment=Appointment.new(modified_params)
		respond_to do |format|
	      if @appointment.save
	        format.html { redirect_to admin_index_path, notice: 'Appointment was successfully created.' }
	        format.json { render :show, status: :created, location: @appointment }
	      else
	        format.html { render :new }
	        format.json { render json: @appointment.errors, status: :unprocessable_entity }
	      end
		end
	end

private
    def appointment_params
      params.require(:appointment).permit(:schedule, :room)
    end
end
