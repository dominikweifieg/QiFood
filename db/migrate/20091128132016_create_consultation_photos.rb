class CreateConsultationPhotos < ActiveRecord::Migration
  def self.up
    create_table :consultation_photos do |t|
      t.column :parent_id,  :integer
			t.column :aliment_id, :integer
			t.column :content_type, :string
			t.column :filename, :string    
			t.column :thumbnail, :string 
			t.column :size, :integer
			t.column :width, :integer
			t.column :height, :integer
      t.column :title, :string
      t.column :consultation_id,  :integer
			t.timestamps
    end
  end

  def self.down
    drop_table :consultation_photos
  end
end