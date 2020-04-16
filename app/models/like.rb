class Like < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
  validates :user_id, uniqueness: {scope: :artwork_id}
  
end
