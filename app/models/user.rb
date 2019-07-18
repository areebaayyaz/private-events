class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :created_events, dependent: :destroy, foreign_key: "creator_id", class_name: "Event"
  has_many :event_attendings, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendings
end
