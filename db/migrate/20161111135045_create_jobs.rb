class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :driver_id
      t.integer :customer_id
      t.datetime :pickup_time
      t.integer :location1_id
      t.integer :location2_id
      t.integer :status

      t.timestamps
    end
  end
end
