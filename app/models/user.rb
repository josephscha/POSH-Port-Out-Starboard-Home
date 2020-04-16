class User < ApplicationRecord
  has_many :artworks, dependent: :destroy
  has_many :artists, through: :artworks
  has_many :object_types, through: :artworks
  has_many :likes, dependent: :destroy
      #would also has_many :artworks through: :likes
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password

  def my_sale_artworks
    self.artworks.select do |artwork|
      artwork.for_sale == true 
    end
  end

  def total_likes 
    total = 0 
    self.artworks.each do |a|
      total +=  a.likes_count
    end 
    total 
  end

  def self.best_first
    self.all.sort_by do |user|
      -user.total_likes
    end
  end

  def current_gallery_value
    total = 0
    self.artworks.each do |artwork|
      total += artwork.price
    end
    total
  end

  def total_artworks 
    self.artworks.count
  end
end

