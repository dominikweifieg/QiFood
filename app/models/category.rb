class Category < ActiveRecord::Base
	
	translates :name, :description
	
	has_many :aliments

end
