class State < ApplicationRecord
	extend FriendlyId
  friendly_id :full_name, use: :slugged

	has_many :locations, -> { order(store_name: :asc) }
	has_many :stores

	validates :name, presence: true
	validates :full_name, presence: true

  default_scope -> { order(name: :asc)}
end
