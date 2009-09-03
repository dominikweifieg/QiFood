# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem	
	helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fadac226a8f1f4656ffd7120d88394f6'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
	
	before_filter :set_locale

	private 
	def set_locale
		if session[:locale]
			I18n.locale = session[:locale]
		else
			I18n.locale = "de"
		end
	end
	
  def authorized_editor?
    if logged_in?
      unless current_user_in_role? User::EDITOR
        flash[:notice] = t('user.missing_rights')
      end
    end
  end
  
  def aliment_links(text)
	  aliments = Aliment.all(:select => "id, name, plural_name", :order => "name DESC")
	  aliments.each do |aliment|
	    text = text.gsub(/(^|\s)#{aliment.name}/im, " <a class=\"plain\" href=\"#{url_for(aliment)}\">#{aliment.name}</a>")
	    text = text.gsub(/(^|\s)#{aliment.plural_name}/im, " <a class=\"plain\" href=\"#{url_for(aliment)}\">#{aliment.plural_name}</a>") unless aliment.plural_name = aliment.name
	  end 
    text
  end
  
  private 
	def check_editor_access
		unless current_user.role & User::EDITOR == User::EDITOR
			flash[:error] = t('user.missing_rights')
			redirect_to new_session_path
		end
	end
	
end
