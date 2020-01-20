class CreateBoardComments < ActiveRecord::Migration[5.2]
  def change
    create_table :board_comments do |t|
      t.text :content, null: false

      t.timestamps
    end
  end
end
