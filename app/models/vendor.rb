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
end
