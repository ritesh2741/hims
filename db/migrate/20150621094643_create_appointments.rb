class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :schedule
      t.integer :room

      t.timestamps null: false
    end
  end
end
