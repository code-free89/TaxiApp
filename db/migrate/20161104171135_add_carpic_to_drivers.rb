class AddCarpicToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :carpic, :string
  end
end
