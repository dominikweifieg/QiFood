class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :aliment_id
      t.integer :effect_id

      t.timestamps
    end

		remove_column :aliments, :effect
  end

  def self.down
		add_column :aliments, :effect, :text
    drop_table :properties
  end
end
