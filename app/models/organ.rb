class Organ < ActiveRecord::Base
	
	has_many :target_organs

	has_many :aliments, :through => :target_organs, :uniq => true
end

