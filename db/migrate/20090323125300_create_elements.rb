class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.string :name

      t.timestamps
    end

		Element.create([{:name => 'Holz'}, {:name => 'Feuer'}, {:name => 'Erde'}, 
									 {:name => 'Metall'}, {:name => 'Wasser'}])
  end

  def self.down
    drop_table :elements
  end
end
