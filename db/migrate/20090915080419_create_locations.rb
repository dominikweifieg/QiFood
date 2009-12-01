class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :street
      t.string :number
      t.string :additional1
      t.string :additional2
      t.string :zip
      t.string :city
      t.string :state
      t.string :country, :default => "de"
      t.integer :locatable_id
      t.string :locatable_type
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
