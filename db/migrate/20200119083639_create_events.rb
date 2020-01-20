class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :place, null: false
      t.datetime :date
      t.text :content, null: false
      t.datetime :deadline, null: false
      t.integer :capacity
      t.string :image

      t.timestamps
    end
  end
end
