class CreateArtworksTable < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false, unique: true
      t.integer :artist_id, null: false
    end

    add_index :artworks, [:title, :artist_id]
    add_index :artworks, [:artist_id]
  end

end
