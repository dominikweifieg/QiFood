class AddPluralNameToAliment < ActiveRecord::Migration
  def self.up
    add_column :aliments, :plural_name, :string
    
    aliments = Aliment.all(:select => "name")
    aliments.each do |aliment|
      aliment.plural_name = aliment.name
      aliment.save!
    end
    
  end

  def self.down
    remove_column :aliments, :plural_name
  end
end
