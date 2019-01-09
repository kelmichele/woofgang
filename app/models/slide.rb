class Slide < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true

	has_one_attached :image

	# boolean for display? link option? order!
end
