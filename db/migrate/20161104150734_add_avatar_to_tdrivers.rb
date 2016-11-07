class AddAvatarToTdrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :avatar, :string
  end
end
