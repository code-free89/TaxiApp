class AddColsToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :lname, :string
    add_column :customers, :fname, :string
    add_column :customers, :addr1, :string
    add_column :customers, :addr2, :string
    add_column :customers, :town, :string
    add_column :customers, :postcode, :string
    add_column :customers, :county, :string
    add_column :customers, :avatar, :string
  end
end
