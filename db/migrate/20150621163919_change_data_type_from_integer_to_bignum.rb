class ChangeDataTypeFromIntegerToBignum < ActiveRecord::Migration
  def change
  	change_column :doctors, :phone, :bignum
  	change_column :patients, :phone, :bignum
  end
end
