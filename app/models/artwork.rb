class Artwork < ApplicationRecord
  belongs_to :collector
  belongs_to :object_type
  belongs_to :artist
  validates :title, :img_url, :price, :for_sale, :artist_id, :object_type_id, :collector_id, presence: true
end
