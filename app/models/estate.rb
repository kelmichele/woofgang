class Estate < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company, presence: true
  validates :address, presence: true
  # validates :address2, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :est_address, presence: true
  validates :landlord, presence: true
  validates :est_city, presence: true
  validates :est_county, presence: true
  validates :est_state, presence: true
  validates :est_zip, presence: true
  validates :est_develop, presence: true
  validates :est_footage, presence: true
  validates :est_type, presence: true
  validates :est_timeframe, presence: true
  # validates :grapevine, presence: true


  # def self.to_csv(options = {})
  #   desired_columns = ["id","first_name", "last_name", "company", "address", "city", "state", "zip", "email", "phone", "est_address", "landlord", "est_city", "est_county", "est_state", "est_zip", "est_develop", "est_footage", "est_type", "est_timeframe", "created_at"]
  #   CSV.generate(options) do |csv|
  #     csv << desired_columns
  #     all.each do |estate|
  #       csv << estate.attributes.values_at(*desired_columns)
  #     end
  #   end
  # end
end
