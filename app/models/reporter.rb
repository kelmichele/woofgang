class Reporter < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :outlet, presence: true
  validates :question, presence: true
end
