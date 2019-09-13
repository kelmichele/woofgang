class Candidate < ApplicationRecord
  attr_accessor :terms

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :experience, presence: true
  validates :background, presence: true
  validates :preferred_state, presence: true
  validates :preferred_city, presence: true
  validates :cash, presence: true
  validates :time_frame, presence: true
  validates :terms, acceptance: true


  # def self.to_csv(options = {})
  #   desired_columns = ["id", "name", "email", "phone", "address", "city", "state", "zip", "experience", "background", "preferred_state", "preferred_city", "cash", "time_frame", "terms", "created_at"]
  #   CSV.generate(options) do |csv|
  #     csv << desired_columns
  #     all.each do |candidate|
  #       csv << candidate.attributes.values_at(*desired_columns)
  #     end
  #   end
  # end
end
