class AddRegToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :reg, :string
  end
end
