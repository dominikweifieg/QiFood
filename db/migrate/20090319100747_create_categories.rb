class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

		Category.create([{:name => 'Getreide'}, {:name => 'Hülsenfrüchte'}, 
										{:name => 'Nüsse & Samen'}, {:name => 'Gemüse'}, {:name => 'Salate'}, 
										{:name => 'Fleisch'}, {:name => 'Fisch & Meeresfrüchte'}, 
										{:name => 'Früchte & Beeren'}, {:name => 'Öle & Fette'}, 
										{:name => 'Getrocknete Gewürze'}, {:name => 'Frische Kräuter'}, 
										{:name => 'Süssmittel'}, {:name => 'Milchprodukte'}, 
										{:name => 'Sonstiges'}])

    sonstiges_id = Category.find_by_name('Sonstiges').id
		add_column(:aliments, :category_id, :integer, :null => false, :default => sonstiges_id)
  end

  def self.down
		remove_column(:aliments, :category_id)
    drop_table :categories
  end
end
