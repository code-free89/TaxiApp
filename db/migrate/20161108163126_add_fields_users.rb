class AddFieldsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lname, :string
    add_column :users, :fname, :string
    add_column :users, :addr1, :string
    add_column :users, :addr2, :string
    add_column :users, :town, :string
    add_column :users, :postcode, :string
    add_column :users, :county, :string
    add_column :users, :avatar, :string
    add_column :users, :phnum, :string
  end
end
