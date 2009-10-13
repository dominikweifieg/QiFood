class Aliment < ActiveRecord::Base

	belongs_to :category

	has_many :properties

	has_many :effects, :through => :properties, :uniq => true

	has_many :target_organs

	has_many :organs, :through => :target_organs, :uniq => true

	has_many :comments, :as => :commentable, :order => 'created_at DESC'

	has_one :aliment_photo
	
	has_many :favorite_aliments
	
	has_many :users, :through => :favorite_aliments

	accepts_nested_attributes_for :aliment_photo, :allow_destroy => true

	named_scope :conditions, lambda { |*args| {:conditions => args} }
	named_scope :sorted, lambda { |sort_by| 
		sort_by = sort_by + ', savor' unless (sort_by =~ /savor/)
		sort_by = sort_by + ', category_id' unless (sort_by =~ /category_id/)
		sort_by = sort_by + ', temperature' unless (sort_by =~ /temperature/)
		{:order => sort_by}
	}

	def self.find_all_by_parameters(params, page)
		scope = Aliment.scoped(:include => [:category])
		parameter_scope(scope, params)
	end

	def self.count_all_by_parameters(params)
		scope = Aliment.scoped()
		parameter_scope(scope, params).count()
	end

	def self.find_all_by_effects(params, page)
		logger.info("find all by effects")
		if(params[:match_all] == 'all')
			Aliment.find_by_sql ["SELECT * FROM aliments WHERE id IN (SELECT aliment_id FROM properties WHERE effect_id IN (?) GROUP BY aliment_id HAVING COUNT(aliment_id) = ?)", params[:effects], params[:effects].size] 
		else
			Aliment.find(:all, :group => 'aliments.id', :joins => :effects, :conditions => {:effects => {:id => params[:effects]}})
		end
	end
	
	def self.count_all_by_effects(params)
	  logger.info("count all by effects")
	  if(params[:match_all] == 'all')
			result = Aliment.count_by_sql ["SELECT count(id) FROM aliments WHERE id IN (SELECT aliment_id FROM properties WHERE effect_id IN (?) GROUP BY aliment_id HAVING COUNT(aliment_id) = ?)", params[:effects], params[:effects].size] 
		else
			result = Aliment.count(:joins => :effects, :conditions => {:effects => {:id => params[:effects]}})
		end
		logger.info("counted #{result} aliments")
		result
  end

	def self.per_page
		15	
	end
	
	def to_param
	  "#{id}_#{name.parameterize}"
	end

	private 

	def self.parameter_scope(scope, params)
		scope = scope.conditions "name LIKE ?", "#{params[:name]}%" unless params[:name].blank?
		scope = scope.conditions "latin_name LIKE ?", "#{params[:latin_name]}%" unless params[:latin_name].blank?
		scope = scope.conditions "pinyin LIKE ?", "#{params[:pinyin]}%" unless params[:pinyin].blank?
		scope = scope.conditions "chinese = ?", params[:chinese] unless params[:chinese].blank?
		scope = scope.conditions "savor = ?", params[:aliment][:savor] unless params[:aliment][:savor].blank?
		scope = scope.conditions "temperature = ?", params[:aliment][:temperature] unless params[:aliment][:temperature].blank?
		scope = scope.conditions "description LIKE ?", "%#{params[:description]}%" unless params[:description].blank?
		scope = scope.conditions "category_id IN (?)", params['category_id'] unless params['category_id'].blank?
    scope
	end

  
end
