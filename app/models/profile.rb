class Profile < ApplicationRecord
  belongs_to :user
  # belongs_to :job, foreign_key: 'customer_id'
  has_many :job

  mount_uploader :avatar, AvatarUploader
  mount_uploader :carpic, AvatarUploader

  # Roles provided by enum
  enum role: [ :customer, :driver, :dispatcher, :admin ]
end
