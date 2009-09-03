class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :commentable_type
      t.integer :commentable_id
      t.string :lang
      t.boolean :published, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
