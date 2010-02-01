class AddPerishableTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :perishable_token, :string, :default => "", :null => false
    add_index :users, :perishable_token
    add_index :users, :email
  end

  def self.down
    remove_index :users, :email
    remove_index :users, :perishable_token
    remove_column :users, :perishable_token
  end
end
