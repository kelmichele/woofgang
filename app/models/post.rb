class Post < ApplicationRecord
	extend FriendlyId
  friendly_id :pug, use: :slugged

	has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true
  validates :url, presence: true

  def pug
    "#{url}".downcase.parameterize
  end
end
