class CreateCollectors < ActiveRecord::Migration[6.0]
  def change
    create_table :collectors do |t|
      t.string :name
      t.string :location
      t.string :email
      t.string :img_url
      t.string :bio

      t.timestamps
    end
  end
end
