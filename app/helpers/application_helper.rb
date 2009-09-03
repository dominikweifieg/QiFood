# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def title(page_title, show_title = true)
		@content_for_title = "#{t('main_title')} | #{page_title}"
		@content_for_h2 = page_title
    @show_title = show_title
	end
  
  def show_title?
    @show_title
	end	

	def navigation_link_to(url, &block)
	  request = @controller.request
	  request_uri = request.request_uri.split('?').first
		if request_uri.starts_with? url
			link_to(url, :class => 'active', &block)
		else
			link_to(url, &block)
		end
	end
	
	def blog_auto_discovery_link_tag
	  if @user
	    auto_discovery_link_tag(:atom, user_posts_path(@user))
    else
      auto_discovery_link_tag(:atom, posts_path)
    end
  end
  
end
  