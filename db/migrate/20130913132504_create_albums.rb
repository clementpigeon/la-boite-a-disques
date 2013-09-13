class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null:false
      t.references :band, null:false
      t.integer :year
      t.string :album_type

      t.timestamps
    end
    add_index :albums, :band_id
    add_index :albums, :title
  end
end
