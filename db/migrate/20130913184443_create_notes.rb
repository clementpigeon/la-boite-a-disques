class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :track
      t.references :user
      t.text :text

      t.timestamps
    end
    add_index :notes, :track_id
    add_index :notes, :user_id
  end
end
