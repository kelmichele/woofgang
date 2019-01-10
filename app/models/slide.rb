class Slide < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true

	has_one_attached :image

  default_scope -> { order(order: :asc)}

	# boolean for display? link option? order!
end
