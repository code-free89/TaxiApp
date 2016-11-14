class AddUserReferenceToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :user, index: true, foreign_key: true
  end
end
