class Vendor < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :company, presence: true
	validates :website, presence: true
	validates :category, presence: true
  validates :product, presence: true
	validates :big_box, presence: true
	validates :order_min, presence: true
	validates :wholesale_price, presence: true
	validates :source, presence: true
	validates :shipping, presence: true
	validates :msrp, presence: true

	
	# def self.to_csv(options = {})
 #    desired_columns = ["id", "name", "email", "phone", "address", "company", "website", "category", "product", "big_box", "order_min", "wholesale_price", "source", "shipping", "msrp", "created_at"]
 #    CSV.generate(options) do |csv|
 #      csv << desired_columns
 #      all.each do |reporter|
 #        csv << reporter.attributes.values_at(*desired_columns)
 #      end
 #    end
 #  end
end
