# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController

  # render new.rhtml
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.save do |result|
      if result
        flash[:notice] = t('session.login.success')
        redirect_to root_url
      else
        flash[:error] = t('session.login.failure')
        render :action => 'new'
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = t('session.logout.success') 
    redirect_to root_url
  end

end
