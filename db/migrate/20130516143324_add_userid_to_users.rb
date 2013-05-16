class AddUseridToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shufflerKey, :string
  end
end
