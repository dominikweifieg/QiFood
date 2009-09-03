class AddAuthorsToBook < ActiveRecord::Migration
  def self.up
    add_column :books, :authors, :string
  end

  def self.down
    remove_column :books, :authors
  end
end
