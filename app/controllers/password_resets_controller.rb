class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]  
  before_filter :require_no_user 
  
  def new
  end

  def create
    @user = User.find_by_email(params[:email])  
    if @user  
      @user.deliver_password_reset_instructions!  
      flash[:notice] = t('user.password_reset_requested') 
      redirect_to root_url  
    else  
      flash[:notice] = t('user.password_reset_no_user')  
      render :action => :new  
    end  
  end

  def edit
  end

  def update
    @user.password = params[:user][:password]  
    @user.password_confirmation = params[:user][:password_confirmation]  
    if @user.save  
      flash[:notice] = t('user.password_reset_success')
      redirect_to @user  
    else  
      render :action => :edit  
    end
  end

  private  
  def load_user_using_perishable_token  
    @user = User.find_using_perishable_token(params[:id])  
    unless @user  
      flash[:notice] = t('user.password_reset_token_not_found')
      redirect_to root_url  
    end  
  end
end
