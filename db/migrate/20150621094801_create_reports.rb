class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :detail
      t.text :prescription

      t.timestamps null: false
    end
  end
end
