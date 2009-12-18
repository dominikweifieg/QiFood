# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	helper :all # include all helpers, all the time
	helper_method :current_user, :logged_in?

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fadac226a8f1f4656ffd7120d88394f6'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
	
	before_filter :set_locale, :fetch_referrer

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
	    text = text.gsub(/(^|\s)#{aliment.name}/im, " <a class=\"plain aliment_link\" href=\"#{url_for(aliment)}\">#{aliment.name}</a><div class=\"aliment_preview\" id=\"aliment_preview_#{aliment.id}\" style=\"display:none\"></div>")
	    text = text.gsub(/(^|\s)#{aliment.plural_name}/im, " <a class=\"plain aliment_link\" href=\"#{url_for(aliment)}\">#{aliment.plural_name}</a><div class=\"aliment_preview\" id=\"aliment_preview_#{aliment.id}\" style=\"display:none\"></div>") unless aliment.plural_name = aliment.name
	  end 
    text
  end
  
  def logged_in?
    current_user
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def login_required
    unless current_user
      flash[:error] = t('user.login_required')
      redirect_to login_path
    end
  end

	def check_editor_access
		unless current_user.role & User::EDITOR == User::EDITOR
			flash[:error] = t('user.missing_rights')
			redirect_to new_session_path
		end
	end
	
	def fetch_referrer
	  if request.headers["Referer"]
	    ref = request.headers["Referer"].sub(/(http)s?:\/\//, "").sub(/:\d+/, "")
	    if ref.index(request.host) == 0
        @back = ref.sub(request.host, "")
        logger.info { "#{@back}" }
      end
    end
  end
	
end
