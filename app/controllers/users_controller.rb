class UsersController < ApplicationController
  
  before_filter :fix_birthday, :only => [:create, :update]
  
  def index
    if params[:name].present? && params[:first_name].present? 
      @users = User.paginate(:all, :conditions => ["name LIKE ? AND first_name LIKE ?", "#{params[:name]}%", "#{params[:first_name]}%"], :page => params[:page])
    elsif params[:name].present?
      @users = User.paginate(:all, :conditions => ["name LIKE ?", "#{params[:name]}%"], :order => 'name, first_name', :page => params[:page])
    elsif params[:first_name].present?
      @users = User.paginate(:all, :conditions => ["first_name LIKE ?", "#{params[:first_name]}%"], :order => 'name, first_name', :page => params[:page])
    else
      @users = User.paginate(:all, :order => 'name, first_name', :page => params[:page])
    end
    
    respond_to do |wants|
      wants.html {  }
      wants.js {  }
    end
  end

  # render new.rhtml
  def new
    @user = User.new
		@user.profile = Profile.new
		@user.user_photo = UserPhoto.new
  end
 
  def create
    @user = User.new(params[:user])
    @user.save do |result|
      if result
        flash[:notice] = t('user.controller.create.success')
        redirect_to root_url
      else
        @user.user_photo ||= UserPhoto.new
        @user.profile ||= Profile.new
        @user.location ||= Location.new
        flash[:error]  = t('user.controller.create.failure')
        render :action => 'new'
      end
    end
  end
  
  def edit
    unless current_user.admin?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    if @user
      @user.profile ||= Profile.new
      @user.user_photo ||= UserPhoto.new
      @user.location ||= Location.new
      respond_to do |wants|
        wants.html {  }
      end
    else 
      flash[:error] = t('user.controller.edit.not_logged_in')
      redirect_to(login_path)
    end
  end
  
  def update
    unless current_user.admin?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    unless @user
      flash[:error] = t('user.controller.edit.not_logged_in')
      redirect_to(login_path)
    end
    @user.attributes = params[:user]
    @user.save do |result|
      if result
        flash[:notice] = t('user.controller.update.success')
        render :action => 'show'
      else
        flash[:error] = t('user.controller.update.failure')
        @user.profile ||= Profile.new
        @user.user_photo ||= UserPhoto.new
        render :action => 'edit'
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
    @user.profile ||= Profile.new
    respond_to do |wants|
      wants.html {  }
    end 
  end
  
  private 
  def fix_birthday
    if params[:profile]
      params[:user][:profile_attributes]["birthday(3i)"] = params[:profile]["birthday(3i)"] if params[:profile]["birthday(3i)"]
      params[:user][:profile_attributes]["birthday(2i)"] = params[:profile]["birthday(2i)"] if params[:profile]["birthday(2i)"]
      params[:user][:profile_attributes]["birthday(1i)"] = params[:profile]["birthday(1i)"] if params[:profile]["birthday(1i)"]
    end
  end
end
