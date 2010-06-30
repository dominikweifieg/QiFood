class Effect < ActiveRecord::Base

  translates :description

	has_many :properties
	has_many :aliments, :through => :properties, :uniq => true, :order => 'aliment_translations.name', :include => :translations

end
