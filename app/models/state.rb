class State < ApplicationRecord
	extend FriendlyId
  friendly_id :full_name, use: :slugged

	has_many :locations, -> { order(city: :asc) }

	validates :name, presence: true
	validates :full_name, presence: true

  default_scope -> { order(full_name: :asc)}
end
