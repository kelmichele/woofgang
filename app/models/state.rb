class State < ApplicationRecord
	extend FriendlyId
  friendly_id :full_name, use: :slugged

	has_many :locations
	has_many :stores

	validates :name, presence: true
	validates :full_name, presence: true
end
