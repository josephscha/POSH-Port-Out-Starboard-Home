class ChangeArtworkForSale < ActiveRecord::Migration[6.0]
  def change
    change_column :artworks, :for_sale, :boolean, default: false
  end
end
