class Post < ApplicationRecord
	extend FriendlyId
  friendly_id :url, use: :slugged

	has_one_attached :image

  validates :title, presence: true
  validates :content, presence: true
  validates :url, presence: true

  default_scope -> { order(date: :desc) }

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


	def self.import(file)
	  spreadsheet = Roo::Spreadsheet.open(file.path)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    post = find_by(title: row["title"]) || new
	    post.attributes = row.to_hash
	    post.save!
	  end
	end

	def self.to_csv(options = {})
	  desired_columns = ["id", "title", "content", "url", "date", "slug"]
	  CSV.generate(options) do |csv|
	    csv << desired_columns
	    all.each do |post|
	      csv << post.attributes.values_at(*desired_columns)
	    end
	  end
	end

end
