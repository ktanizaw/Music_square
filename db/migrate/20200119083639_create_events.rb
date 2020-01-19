class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :place
      t.datetime :date
      t.text :content
      t.datetime :deadline
      t.integer :capacity
      t.string :image

      t.timestamps
    end
  end
end
