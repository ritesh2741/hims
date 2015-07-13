# Appointments Controller
class AppointmentsController < ApplicationController
  load_and_authorize_resource
  def index
    @appointments = Appointment.all
  end

  def new
    @patients = Patient.all
    @doctors = Doctor.all
    @appointment = Appointment.new
  end

  def create
    modified_params = appointment_params.merge(doctor_id: params[:doctor_id], patient_id: params[:patient_id], status: 'Pending')
    @appointment = Appointment.new(modified_params)
    if @appointment.bookable?
      respond_to do |format|
        if @appointment.save
          format.html { redirect_to admin_index_path, notice: 'Appointment was successfully created' }
          format.json { render :show, status: :created, location: @appointment }
        else
          format.html { render :new }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
       end
      end
    else
      redirect_to admin_index_path, alert: "Sorry, all 4 appointments for today have been booked for Dr.#{@appointment.doctor.name} on Date: #{@appointment.schedule}"
    end
  end

  def approve_or_reject
    appointment = Appointment.find(params[:appointment_id])
    if params[:identifier] == 'approve'
      appointment.status = 'Approved'
    elsif params[:identifier] == 'reject'
      appointment.status = 'Rejected'
    else
      appointment.status = 'Pending'
    end
    appointment.save!
    redirect_to appointments_path, notice: params[:identifier]
  end

  private

  def appointment_params
    params.require(:appointment).permit(:room, :schedule)
  end
end
