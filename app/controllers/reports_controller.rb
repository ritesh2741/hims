class ReportsController < ApplicationController
  load_and_authorize_resource
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :set_patient, only: [:index, :new, :create]

  def index
    @reports = @patient.reports
  end

  def show
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create

    @report = Report.new(report_params)
    @report.patient = @patient

    respond_to do |format|
      if @report.save
        format.html { redirect_to patient_reports_path(@report.patient), notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to patient_reports_path, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_report
      @report = Report.find(params[:id])
    end

    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def report_params
      params.require(:report).permit(:title, :detail, :prescription)
    end
end
