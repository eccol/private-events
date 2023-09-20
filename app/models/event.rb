class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :rsvps, dependent: :destroy
  has_many :attendees, through: :rsvps, source: :user
  
  scope :past, -> { where('date < ?', Time.now)}
  scope :future, -> { where('date > ?', Time.now)}
end
