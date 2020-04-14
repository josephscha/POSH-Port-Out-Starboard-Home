class Artist < ApplicationRecord
  has_many :artworks, dependent: :destroy
  has_many :collectors, through: :artworks
  has_many :object_types, through: :artworks
  validates :name, :bio, presence: true
end
