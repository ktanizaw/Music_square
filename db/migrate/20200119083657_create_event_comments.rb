class CreateEventComments < ActiveRecord::Migration[5.2]
  def change
    create_table :event_comments do |t|
      t.text :content, null: false

      t.timestamps
    end
  end
end
