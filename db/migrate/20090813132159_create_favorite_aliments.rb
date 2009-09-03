class CreateFavoriteAliments < ActiveRecord::Migration
  def self.up
    create_table :favorite_aliments do |t|
      t.column :user_id, :integer
      t.column :aliment_id, :integer
      t.column :reason, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :favorite_aliments
  end
end
