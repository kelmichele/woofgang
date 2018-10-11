class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  default_scope -> { order(street: :asc)}

  def address
    [street, city_state, zip].compact.join(" , ")
  end

  def city_state
    "#{city}, #{state}"
  end

  def full_address
    "#{street}" + "\n" + "#{city}, #{state} #{zip}" + "\n"
    # + "(#{latitude}, #{longitude})"
  end


  def address_changed?
    street_changed? || suite_changed? || city_changed? || state_changed? || zip_changed?
  end

end

# rake geocode:all CLASS=Location SLEEP=0.25 BATCH=100
# Location.near("")
