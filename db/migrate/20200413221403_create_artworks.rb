class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.belongs_to :collector, null: false, foreign_key: true
      t.belongs_to :object_type, null: false, foreign_key: true
      t.belongs_to :artist, null: false, foreign_key: true
      t.string :title
      t.string :img_url
      t.float :price
      t.boolean :for_sale

      t.timestamps
    end
  end
end
