class AddRoleToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :role, :integer
  end
end
