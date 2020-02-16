class CreateArtistBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_boards do |t|
      t.string :artists, null: false
      t.text :albums
      t.text :profiles
      t.string :icon

      t.timestamps
    end
  end
end
