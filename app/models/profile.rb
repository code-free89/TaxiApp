class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  mount_uploader :carpic, AvatarUploader

  # Roles provided by enum
  enum role: [ :customer, :driver, :dispatcher, :admin ]
end
