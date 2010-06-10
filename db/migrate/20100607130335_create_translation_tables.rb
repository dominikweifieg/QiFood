class CreateTranslationTables < ActiveRecord::Migration
  def self.up
    I18n.locale = "de"
    Aliment.create_translation_table! :name => :string, :description => :string
    execute "INSERT INTO aliment_translations (aliment_id, locale, description, name, created_at, updated_at) SELECT id, 'de', description, name, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM aliments;"
    Category.create_translation_table! :name => :string, :description => :string
    execute "INSERT INTO category_translations (category_id, locale, description, name, created_at, updated_at) SELECT id, 'de', description, name, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM categories;"
    Effect.create_translation_table! :description => :string
    execute "INSERT INTO effect_translations (effect_id, locale, description, created_at, updated_at) SELECT id, 'de', description, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM effects;"
    Element.create_translation_table! :name => :string
    execute "INSERT INTO element_translations (element_id, locale, name, created_at, updated_at) SELECT id, 'de', name, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM elements;"
    Organ.create_translation_table! :name => :string
    execute "INSERT INTO organ_translations (organ_id, locale, name, created_at, updated_at) SELECT id, 'de', name, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM organs;"
  end

  def self.down
    Aliment.drop_translation_table!
    Category.drop_translation_table!
    Effect.drop_translation_table!
    Element.drop_translation_table!
    Organ.drop_translation_table!
  end
end
