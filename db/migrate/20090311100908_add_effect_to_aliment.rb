class AddEffectToAliment < ActiveRecord::Migration
  def self.up
    add_column :aliments, :effect, :text
		change_column :aliments, :description, :text
  end

  def self.down
    remove_column :aliments, :effect
		change_column :aliments, :description, :string
  end
end
