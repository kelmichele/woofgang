class Post < ApplicationRecord
	extend FriendlyId
  friendly_id :pug, use: :slugged

	has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true
  validates :url, presence: true

  default_scope -> { order(created_at: :desc) }

  def pug
    "#{url}".downcase.parameterize
  end

  def this_post
  	id
  end

	# def next
	#   Post.where(["id < ?", id]).last
	# end

	# def previous
	#   Post.where(["id > ?", id]).first
	# end

	def prev
	  Post.where("id > ?", id).order(id: :desc).limit(1).first
	end

	def next_post
    Post.where("id < ?", id).order(id: :asc).limit(1).first
	end

end
