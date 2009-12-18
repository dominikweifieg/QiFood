class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.text :body
      t.datetime :start
      t.datetime :end
      t.boolean :commercial
      t.string :reference_number
      t.integer :user_id
      t.integer :consultation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
