class FavoriteAlimentsController < ApplicationController
  
  before_filter :login_required
  
  def create
    @favorite = FavoriteAliment.new()
    @favorite.user = current_user
    @aliment = Aliment.find(params[:aliment_id])
    @favorite.aliment = @aliment
    if current_user && @favorite.save
      flash[:notice] = t('favorite.create.success', :aliment_name => @aliment.name)
      respond_to do |wants|
        wants.html { redirect_to aliment_path(@aliment) }
      end
    else
      flash[:error] = t('favorite.create.failure', :aliment_name => @aliment.name)
      respond_to do |wants|
        wants.html { redirect_to aliment_path(@aliment)  }
      end
    end
  end

  def destroy
    @favorite = FavoriteAliment.find(params[:id])
    aliment_name = @favorite.aliment.name
    if @favorite.user == current_user
      @favorite.destroy
      flash[:notice] = t('favorite.destroy.success', :aliment_name => aliment_name)
      respond_to do |wants|
        wants.html {  redirect_to user_path(current_user)}
      end
    else
      flash[:error] = t('favorite.destroy.failure', :aliment_name => aliment_name)
      redirect_to login_path
    end
  end

end
