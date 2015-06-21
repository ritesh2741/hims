class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetimme :schedule
      t.integer :room

      t.timestamps null: false
    end
  end
end
