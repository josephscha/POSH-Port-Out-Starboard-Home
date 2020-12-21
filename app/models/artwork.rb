class Artwork < ApplicationRecord
  belongs_to :user
  belongs_to :object_type
  belongs_to :artist
  has_many :likes , dependent: :destroy
  has_one_attached :image

  def self.for_sale?
    self.all.select do |artwork|
      artwork.for_sale == true
    end 
  end

  def likes_count 
    self.likes.count
  end

  def self.sort_artwork
    self.sort_by do |artwork|
      -artwork.likes.count
    end
  end

  def buy_artwork(buyer_id) #changes ownership , gets buyer_id from sessions[:id]
    #When user "buys" an artwork, the previous user_id associated with the artwork will be updated to the user_id of the buyer.
    self.user_id = buyer_id 
    self.save
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    return self.artist_id = artist.id
  end
  
  def artist_name
    self.artist ? self.artist.name : nil
  end
  
end
