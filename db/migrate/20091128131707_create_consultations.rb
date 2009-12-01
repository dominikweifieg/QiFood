class CreateConsultations < ActiveRecord::Migration
  def self.up
    create_table :consultations do |t|
      t.string :title
      t.text :body
      t.boolean :pro
      t.string :pro_identifier
      t.integer :pro_start_day
      t.string :website
      t.string :email
      t.string :phone
      t.string :fax
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :consultations
  end
end
