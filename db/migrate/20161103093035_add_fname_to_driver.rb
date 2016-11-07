class AddFnameToDriver < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :fname, :string
  end
end
