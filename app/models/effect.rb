class Effect < ActiveRecord::Base

	has_many :properties
	has_many :aliments, :through => :properties, :uniq => true, :order => 'name'

end
