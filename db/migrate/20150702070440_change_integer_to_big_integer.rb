class ChangeIntegerToBigInteger < ActiveRecord::Migration
  def change
  	change_column :doctors, :phone, :bigint
  	change_column :patients, :phone, :bigint
  end
end
