class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.text :about
      t.date :birthday
      t.string :quote
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
