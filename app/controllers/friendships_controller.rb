class FriendshipsController < ApplicationController
  
  before_filter :login_required
  
  def create
    @user = current_user
    @friend = User.find(params[:friend_id])
    @user.friends << @friend
    if @user.save
      flash[:notice] = t('friendship.controller.create.success', :name => @friend.first_name)
      respond_to do |wants|
        wants.html { redirect_to @user }
      end
    else
      flash[:error] = t('friendship.controller.create.failure', :name => @friend.first_name)
      respond_to do |wants|
        wants.html { redirect_to @user }
      end
    end
  end

  def destroy
    @user = current_user
    @friendship = Friendship.find(params[:id])
    if(@user == @friendship.user)
      @friendship.destroy
      flash[:notice] = t('friendship.controller.destroy.success', :name => @friendship.friend.first_name)
      respond_to do |wants|
        wants.html { redirect_to @user }
        wants.js {  }
      end
    else
      flash[:error] = t('friendship.controller.destroy.wrong_user')
      respond_to do |wants|
        wants.html { redirect_to sessions_path, :method => :delete }
      end
    end
  end

end
