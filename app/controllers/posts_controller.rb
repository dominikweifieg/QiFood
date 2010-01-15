class PostsController < ApplicationController

  before_filter :login_required, :except => [:index, :show]
  before_filter :fetch_user
  
  caches_action :show, :cache_path => :show_cache_path.to_proc

  def index
    if @user
      @posts = @user.posts.paginate(:page => params[:page])
    else
      @posts = Post.paginate(:page => params[:page])
    end
  end

  def show
    @post = Post.find(params[:id])
    
    if @post
      @body = aliment_links(@post.body)
      respond_to do |wants|
        wants.html {  }
        wants.atom {  }
      end
    else
      flash[:error] = t('post.controller.show.deleted')
      respond_to do |wants|
        wants.html {  render :action => "index", :status => 404 }
      end
    end
  end
  
  def preview
    @body = params[:body]
    respond_to do |wants|
      wants.html {  render :partial => "preview"}
    end
  end

  def new
    @post = Post.new
    
    respond_to do |wants|
      wants.html {  }
    end
  end

  def create
    permalink = params[:post][:title].parameterize
    postfix = 1
    while Post.exists? :permalink => permalink
      permalink = params[:post][:title].parameterize + "-" + postfix
      postfix = postfix + 1
    end
    params[:post][:permalink] = permalink
    
    #params[:post][:body] = aliment_links(params[:post][:body])
    @post = @user.posts.build(params[:post])
    
    if @post.save
      flash[:notice] = t('post.controller.create.success')
      respond_to do |wants|
        wants.html { redirect_to user_post_path(@user, @post)  }
      end
    else
      flash[:error] = t('post.controller.create.failure')
      respond_to do |wants|
        wants.html { render :action => "new" }
      end
    end
  end

  def edit
    @post = @user.posts.find(params[:id])
  end

  def update
    @post = @user.posts.find(params[:id])
    #params[:post][:body] = aliment_links(params[:post][:body])
    if @post.update_attributes(params[:post])
      expire_action :action => :show
      flash[:notice] = t('post.controller.update.success')
      respond_to do |wants|
        wants.html { redirect_to user_post_path(@user, @post)  }
      end
    else
      flash[:error] = t('post.controller.update.failure')
      respond_to do |wants|
        wants.html {  render :action => "edit" }
      end
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy
    
    respond_to do |wants|
      wants.html { redirect_to user_posts(@user)  }
    end
  end
  
  private
  
  def fetch_user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    end
  end

  def show_cache_path
    if @user
      if @user == current_user
        "current_user/posts/#{params[:id]}"
      else
        "user/posts/#{params[:id]}"
      end
    else
      if current_user
        "loggedin/posts/#{params[:id]}"
      else
        "common/posts/#{params[:id]}"
      end
    end
  end

end
