class CreateCategorizes < ActiveRecord::Migration[5.2]
  def change
    create_table :categorizes do |t|
      t.references :category, null: false, foreign_key: true
      t.references :artist_board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
