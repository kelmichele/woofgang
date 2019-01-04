class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :location
  belongs_to :store
end
