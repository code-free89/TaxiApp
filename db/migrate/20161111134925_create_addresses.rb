class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :addr1
      t.string :addr2
      t.string :town
      t.string :county
      t.string :postcode

      t.timestamps
    end
  end
end
