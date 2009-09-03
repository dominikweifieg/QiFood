class CreateOrgans < ActiveRecord::Migration
  def self.up
    create_table :organs do |t|
      t.string :name
      t.string :yinyang
			t.integer :time
      t.integer :element_id

      t.timestamps
		end
			Organ.create([{:name => 'Leber', :yinyang => 'Yin', :time => 1, :element_id => 1}, 
									 {:name => 'Gallenblase', :yinyang => 'Yang', :time => 23, :element_id => 1},
									 {:name => 'Herz', :yinyang => 'Yin', :time => 11, :element_id => 2},
									 {:name => 'Dünndarm', :yinyang => 'Yang', :time => 13, :element_id => 2},
									 {:name => 'Sanjiao', :yinyang => 'Yin', :time => 21, :element_id => 2},
									 {:name => 'Perikard', :yinyang => 'Yang', :time => 19, :element_id => 2},
									 {:name => 'Milz', :yinyang => 'Yin', :time => 9, :element_id => 3},
									 {:name => 'Magen', :yinyang => 'Yang', :time => 7, :element_id => 3},
									 {:name => 'Lunge', :yinyang => 'Yin', :time => 3, :element_id => 4},
									 {:name => 'Dickdarm', :yinyang => 'Yang', :time => 5, :element_id => 4},
									 {:name => 'Nieren', :yinyang => 'Yin', :time => 17, :element_id => 5},
									 {:name => 'Blase', :yinyang => 'Yang', :time => 15, :element_id => 5}])

		create_table :target_organs do |t|
			t.integer :aliment_id
			t.integer :organ_id
		end
  end

  def self.down
    drop_table :organs
		drop_table :target_organs
  end
end
