class Comment < ActiveRecord::Base

	belongs_to :commentable, :polymorphic => true
	belongs_to :user

	default_scope  :conditions => {:lang => "#{I18n.locale}", :published => true}, :order => 'updated_at DESC'

  can_be_flagged
	
	def reasons
	  I18n.t [:inapproriate, :off_topic, :foul_language], :scope => 'flag.reasons'
  end
	
	def callback(sym)	
		if sym == :after_flagged
			published = false if flags.size > 3
		end
	end

end
