class Collector < ApplicationRecord
  has_many :artworks, dependent: :destroy
  has_many :artists, through: :artworks
  has_many :object_types, through: :artworks
end
