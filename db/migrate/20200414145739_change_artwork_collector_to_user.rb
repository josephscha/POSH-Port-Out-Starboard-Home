class ChangeArtworkCollectorToUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :artworks, :collector_id, :user_id
  end
end
