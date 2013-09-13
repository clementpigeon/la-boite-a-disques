class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title, null:false
      t.references :album, null:false
      t.boolean :bonus, null:false
      t.text :lyrics
      t.integer :track_number
      t.integer :length

      t.timestamps
    end
    add_index :tracks, :album_id
    add_index :tracks, :title
  end
end
