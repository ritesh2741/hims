class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :description
      t.date :dob
      t.char :gender
      t.integer :phone
      t.text :address

      t.timestamps null: false
    end
  end
end
