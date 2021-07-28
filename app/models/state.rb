class State < ApplicationRecord
	extend FriendlyId
  friendly_id :full_name, use: :slugged

	has_many :locations, -> { order(store_name: :desc) }

	validates :name, presence: true
	validates :full_name, presence: true

  default_scope -> { order(full_name: :asc)}
end
