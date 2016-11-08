class UpdateUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :boolean, :string
    add_column :users, :admin, :boolean, default: false
  end
end
