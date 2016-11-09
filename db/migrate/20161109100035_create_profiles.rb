class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :lname
      t.string :fname
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
