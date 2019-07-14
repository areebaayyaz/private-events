class User < ApplicationRecord
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	has_many :created_events, dependent: :destroy, foreign_key: "creator_id", class_name: "Event"
end
