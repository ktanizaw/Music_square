class AddUserRefToEventComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_comments, :user, foreign_key: true
  end
end
