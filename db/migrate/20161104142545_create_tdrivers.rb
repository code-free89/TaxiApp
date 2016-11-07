class CreateTdrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :fname
      t.string :lname
      t.binary :pic1
      t.binary :pic2
      t.string :reg

      t.timestamps
    end
  end
end
