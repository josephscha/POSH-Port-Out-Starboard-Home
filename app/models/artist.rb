class Artist < ApplicationRecord
  has_many :artworks, dependent: :destroy
  has_many :users, through: :artworks
  has_many :object_types, through: :artworks
  validates :name, presence: true


  def artist_name=(name)
    self.name = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:name)
  end
  
  def self.name_sort
    self.all.sort_by do |object|
      object.name
    end
  end
end
