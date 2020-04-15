class User < ApplicationRecord
  has_many :artworks, dependent: :destroy
  has_many :artists, through: :artworks
  has_many :object_types, through: :artworks
  has_many :likes
      #would also has_many :artworks through: :likes
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
end

