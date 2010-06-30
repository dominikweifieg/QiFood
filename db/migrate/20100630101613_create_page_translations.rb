class CreatePageTranslations < ActiveRecord::Migration
  def self.up
    Page.create_translation_table! :title => :string, :body => :text
    insert "INSERT INTO page_translations (page_id, locale, title, body, created_at, updated_at) SELECT id, 'de', title, body, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM pages;"
  end

  def self.down
    Page.drop_translation_table!
  end
end
