class CreateAliments < ActiveRecord::Migration
  def self.up
    create_table :aliments do |t|
      t.string :name
      t.string :latin_name
      t.string :pinyin
      t.string :chinese
      t.string :description
      t.integer :savor
      t.integer :savor_tendence
      t.integer :temperature
      t.integer :temperature_tendence

      t.timestamps
    end
  end

  def self.down
    drop_table :aliments
  end
end
