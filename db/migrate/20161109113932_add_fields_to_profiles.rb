class AddFieldsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :addr1, :string
    add_column :profiles, :addr2, :string
    add_column :profiles, :phnum, :string
    add_column :profiles, :town, :string
    add_column :profiles, :postcode, :string
    add_column :profiles, :avatar, :string
    add_column :profiles, :county, :string
  end
end
