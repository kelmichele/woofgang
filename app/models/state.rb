class State < ApplicationRecord
	extend FriendlyId
  friendly_id :full_name, use: :slugged

	has_many :locations

	validates :name, presence: true
	validates :full_name, presence: true
end
