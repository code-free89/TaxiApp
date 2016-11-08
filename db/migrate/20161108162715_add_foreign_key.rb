class AddForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :customers, :users, column: :id, primary_key: "user_id"
  end
end
