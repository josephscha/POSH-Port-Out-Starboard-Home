class Artwork < ApplicationRecord
  belongs_to :user
  belongs_to :object_type
  belongs_to :artist
  # validates :title, :img_url, :price, presence: true
  has_many :likes 
  has_many :users, through: :likes
  
  def self.for_sale?
    self.all.select do |artwork|
      artwork.for_sale == true
    end 
  end

end
