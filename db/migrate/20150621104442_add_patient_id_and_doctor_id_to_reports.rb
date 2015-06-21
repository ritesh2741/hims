class AddPatientIdAndDoctorIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :patient_id, :integer
    add_column :reports, :doctor_id, :integer
  end
end
