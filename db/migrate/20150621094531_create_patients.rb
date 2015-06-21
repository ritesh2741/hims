class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.text :description
      t.date :dob
      t.string :gender
      t.integer :phone
      t.text :address

      t.timestamps null: false
    end
  end
end
