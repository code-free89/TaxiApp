class AddLnameToDriver < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :lname, :string
  end
end
