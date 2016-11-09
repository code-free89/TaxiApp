class RemoveFieldsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lname, :string
    remove_column :users, :fname, :string
    remove_column :users, :addr1, :string
    remove_column :users, :addr2, :string
    remove_column :users, :town, :string
    remove_column :users, :postcode, :string
    remove_column :users, :county, :string
    remove_column :users, :avatar, :string
    remove_column :users, :phnum, :string
  end
end
