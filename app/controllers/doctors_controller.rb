class DoctorsController < ApplicationController
  load_and_authorize_resource
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
    @departments = Department.all
  end

  def edit
  end

  def create
    modified_params = doctor_params.merge(department_id: params[:department_id])
    @doctor = Doctor.new(modified_params)
    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def appointments
    @doctor = Doctor.find(params[:doctor_id])
    @appointments = @doctor.appointments
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :description, :dob, :gender, :phone, :address, :department_id)
    end
end
