class ChangeDatatypeFromDateTimeToDate < ActiveRecord::Migration
  def change
  	change_column :appointments, :schedule, :date
  end
end
