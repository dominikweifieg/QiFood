# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def title(page_title, show_title = true)
		@content_for_title = "#{page_title} | #{t('main_title')}"
		@content_for_h2 = page_title
    @show_title = show_title
	end
  
  def show_title?
    @show_title
	end	
	
	def meta_description(description = "")
	  description = t('meta_description') if description.empty?
    @content_for_meta_description = description
    @show_meta_description = true
  end
  
  def show_meta_description?
    @show_meta_description
  end
  
  def meta_keywords(keywords = "QiFood")
    @content_for_meta_keywords = keywords + t('meta_keywords')
    @show_meta_keywords = true
  end
  
  def show_meta_keywords?
    @show_meta_keywords
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
	  if @user && !@user.new_record?
	    auto_discovery_link_tag(:atom, user_posts_path(@user))
    else
      auto_discovery_link_tag(:atom, 'http://feeds.feedburner.com/QiFoodBlog')
    end
  end
  
	def current_user_in_role?(role)
	  return false unless current_user
		current_user.role & role == role
	end	

  def back_link_to(title, path)
    if @back 
      link_to(title, @back)
    else
      link_to(title, path)
    end
  end
  
end
  