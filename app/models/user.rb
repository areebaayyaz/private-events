class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :created_events, dependent: :destroy, foreign_key: "creator_id", class_name: "Event", dependent: :delete_all
  has_many :event_attendings, foreign_key: :attendee_id, dependent: :delete_all
  has_many :attended_events, through: :event_attendings, dependent: :delete_all
end
