class AddColsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :carpic, :string
    add_column :profiles, :reg, :string
  end
end
