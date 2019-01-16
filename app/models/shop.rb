class Shop < ApplicationRecord
  extend FriendlyId
  friendly_id :store_name, use: :slugged

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # has_one_attached :image
  belongs_to :state

  validates :store_name, presence: true
  validates :street_address_one, presence: true, uniqueness: { scope: :city, case_sensitive: false }
  validates :city, presence: true
  validates :state_id, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :email_address, presence: true

  before_save :update_og_state

  # default_scope -> { order(state: :asc)}


  def update_og_state
    self.og_state = self.state.name
  end

  def ntitle
    if store_name.include? "Grooming"
      store_name.remove("Woof Gang Bakery & Grooming")
    else
      store_name.remove("Woof Gang Bakery")
    end
  end

  def c_hours
    hours.split(",")
  end

  def address
    [street_address_one, city_state, zip].compact.join(" , ")
  end

  def city_state
    "#{city}, #{state.name}"
  end

  def full_address
    "#{street_address_one}" + "\n" + "#{city}, #{state.name} #{zip}" + "\n"
  end

  def title_state
    "#{ntitle}, #{state.name}"
  end

  def address_changed?
    street_address_one_changed? || city_changed? || state_id_changed? || zip_changed?
  end

  def direct_link
    "https://www.google.com/maps/dir//" + "#{store_name}" + "," + "#{street_address_one}" + "+" + "#{city}" + "+" + "#{state.name}" + "+" + "#{zip}"
  end



  def soc_links
    [fb, insta, twitter, yelp, site].compact.join(" , ")
  end

  def list_links
    soc_links.split(',')
  end


  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      shop = find_by(store_name: row["store_name"]) || new
      shop.attributes = row.to_hash
      shop.save!
    end
  end

  def self.to_csv(options = {})
    # desired_columns = ["store_name", "email_address", "phone", "street_address_one", "street_address_two", "city", "state", "zip", "hours", "latitude", "longitude"]
    desired_columns = ["id", "store_name", "email_address", "phone", "street_address_one", "street_address_two", "city", "state.name", "zip", "fb", "insta", "twitter", "yelp", "site", "hours", "latitude", "longitude"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |shop|
        csv << shop.attributes.values_at(*desired_columns)
      end
    end
  end

end

# rake geocode:all CLASS=Shop SLEEP=0.25 BATCH=100
# Shop.near("")
# l = Shop.new(street: "", suite: "", city: "", state: "", zip: "", phone: "")
