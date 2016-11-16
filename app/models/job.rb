class Job < ApplicationRecord
  # Statuses provided by enum
  enum status: [ :open, :driver_en_route, :arrived, :collected, :deposited, :archived ]

  belongs_to :driver, class_name: "Profile", foreign_key: 'driver_id'
  belongs_to :customer, :class_name => "Profile", foreign_key: 'customer_id'
  belongs_to :location1, :class_name => "Address", foreign_key: 'location1_id'
  belongs_to :location2, :class_name => "Address", foreign_key: 'location2_id'
end
