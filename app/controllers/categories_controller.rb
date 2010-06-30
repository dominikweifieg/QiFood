class CategoriesController < ApplicationController
  
  before_filter :login_required, :check_editor_access, :except => [:index, :show]
  
  # GET /categories
  # GET /categories.xml
  def index
    sort_by = params[:sort_by]
    sort_by ||= :id
    @categories = Category.find(:all, :order => sort_by)
    
    respond_to do |wants|
      wants.html
      wants.xml
    end
  end
  
  # GET /categories/1
  def show
    @category = Category.find(params[:id])
    @aliments = Aliment.paginate_by_category_id(params[:id], :page => params[:page], :include => :translations, :order => 'aliment_translations.name', :conditions => {'aliment_translations.locale' => "#{I18n.locale}"})
  end
  
  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])

  end
  
  # PUT /categories/1
  def update
    
    @category = Category.find(params[:id])
    
    respond_to do |wants|
      if @category.update_attributes(params[:category])
        flash[:notice] = t('categories.update.success')
        wants.html { redirect_to :action => "index"  }
        wants.xml {redirect_to :action => "index"}
      else
        flash[:error] = t('categories.update.failure')
        wants.html { redirect_to :action => "edit"  } 
        wants.xml  { render :xml => @category.errors, :status => :unprocessable_entity }        
      end
    end
  end
  
end
