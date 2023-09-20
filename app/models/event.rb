class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :rsvps, dependent: :destroy
  has_many :attendees, through: :rsvps, source: :user
  
  scope :past, -> { where('date < ?', Time.now)}
  scope :future, -> { where('date > ?', Time.now)}

  def visible_to?(user)
    if user
      !is_private || (creator_id == user.id || attendees.include?(user))
    else
      !is_private
    end
  end
end
