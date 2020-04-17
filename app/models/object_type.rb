class ObjectType < ApplicationRecord
    has_many :artworks, dependent: :destroy
    has_many :users, through: :artworks
    has_many :artists, through: :artworks
    validates :name, presence: true

    def self.name_sort
        self.all.sort_by do |object|
            object.name
        end
    end
end
