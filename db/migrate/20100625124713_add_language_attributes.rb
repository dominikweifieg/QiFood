class AddLanguageAttributes < ActiveRecord::Migration
  def self.up
    add_column :posts, :lang, :string, :default => "de"
    add_column :consultations, :lang, :string, :default => "de"
    add_column :events, :lang, :string, :default => "de"
  end

  def self.down
    remove_column :events, :lang
    remove_column :consultations, :lang
    remove_column :posts, :lang
  end
end
