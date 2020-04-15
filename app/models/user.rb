class User < ApplicationRecord
  has_many :artworks, dependent: :destroy
  has_many :artists, through: :artworks
  has_many :object_types, through: :artworks
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
end
