class AddDescriptionToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :description, :text, :default => ""
  end

  def self.down
    remove_column :categories, :description
  end
end
