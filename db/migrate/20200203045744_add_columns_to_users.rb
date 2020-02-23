class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string, unique: true
    add_column :users, :provider, :string, unique: true
  end
end
