class Artwork < ApplicationRecord
  belongs_to :user
  belongs_to :object_type
  belongs_to :artist
  # validates :title, :img_url, :price, presence: true
  has_many :likes 
  # has_many :users, through: :likes
  
  def self.for_sale?
    self.all.select do |artwork|
      artwork.for_sale == true
    end 
  end

  def likes_count 
    self.likes.count
  end

  # def self.by_popularity
  #   Like.select('artwork_id, count(artwork_id) as frequency').order('frequency desc').group('artwork_id').map(&:artwork)
  # end
  def self.sort_artwork
    self.sort_by do |artwork|
      -artwork.likes.count
    end
  end

end
