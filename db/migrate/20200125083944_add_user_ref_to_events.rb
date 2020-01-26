class AddUserRefToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :owner, foreign_key: { to_table: :users }
  end
end
