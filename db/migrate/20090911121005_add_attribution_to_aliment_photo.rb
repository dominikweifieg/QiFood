class AddAttributionToAlimentPhoto < ActiveRecord::Migration
  def self.up
    add_column :aliments, :photo_attribution, :string, :limit => 512
  end

  def self.down
    remove_column :aliments, :photo_attribution
  end
end
