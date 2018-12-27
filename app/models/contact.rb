class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :location, presence: true
  # validates :singup, presence: true
  # validates :grapevine, presence: true
  validates :content, presence: true
end
