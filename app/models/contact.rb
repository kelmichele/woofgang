class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :location, presence: true
  # validates :singup, presence: true
  # validates :grapevine, presence: true
  validates :content, presence: true

  # def self.to_csv(options = {})
  #   desired_columns = ["id", "name", "email", "phone", "location", "content", "grapevine", "created_at"]
  #   CSV.generate(options) do |csv|
  #     csv << desired_columns
  #     all.each do |contact|
  #       csv << contact.attributes.values_at(*desired_columns)
  #     end
  #   end
  # end
end
