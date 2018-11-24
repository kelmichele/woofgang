class Vendor < ApplicationRecord
  validates :name, presence: true
  validates :company, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :product, presence: true
end
