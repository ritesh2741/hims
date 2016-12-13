class AddPatientEmailId < ActiveRecord::Migration
  def change
    add_column :patients, :email_id, :string
  end
end
