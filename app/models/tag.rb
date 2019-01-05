class Tag < ApplicationRecord
  has_many :taggings
  has_many :locations, through: :taggings

  # default_scope -> { order(created_at: :asc)}
end
