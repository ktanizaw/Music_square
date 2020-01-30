class ChangeDataIconToArtistBoard < ActiveRecord::Migration[5.2]
  def change
    change_column :artist_boards, :icon, :text
  end
end
