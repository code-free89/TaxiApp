class Job < ApplicationRecord
  # Statuses provided by enum
  enum status: [ :open, :driver_en_route, :arrived, :collected, :deposited, :archived ]
end
