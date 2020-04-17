class ObjectType < ApplicationRecord
    has_many :artworks, dependent: :destroy
    has_many :users, through: :artworks
    has_many :artists, through: :artworks
    validates :name, presence: true
end
