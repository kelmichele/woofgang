class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # validates :street_address_one, presence: true
  validates :street_address_one, presence: true, uniqueness: { scope: :city, case_sensitive: false }
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :email_address, presence: true

  def address
    [street_address_one, city_state, zip].compact.join(" , ")
  end

  def city_state
    "#{city}, #{state}"
  end

  def full_address
    "#{street_address_one}" + "\n" + "#{city}, #{state} #{zip}" + "\n"
    # + "(#{latitude}, #{longitude})"
  end

  def address_changed?
    street_address_one_changed? || street_address_two_changed? || city_changed? || state_changed? || zip_changed?
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      location = find_by(store_name: row["store_name"]) || new
      location.attributes = row.to_hash
      location.save!
    end
  end

  def self.to_csv(options = {})
    desired_columns = ["store_name", "email_address", "phone", "street_address_one", "street_address_two", "city", "state", "zip", "hours", "latitude", "longitude"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |location|
        csv << location.attributes.values_at(*desired_columns)
      end
    end
  end

end

# rake geocode:all CLASS=Location SLEEP=0.25 BATCH=100
# Location.near("")
# l = Location.new(street: "", suite: "", city: "", state: "", zip: "", phone: "")
