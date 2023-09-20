class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :rsvps
  has_many :attendees, through: :rsvps, source: :user
end
