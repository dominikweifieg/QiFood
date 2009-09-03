class EffectsController < ApplicationController
  
  before_filter :login_required, :check_editor_access, :except => [:index, :show]
  
  # GET /effects
  # GET /effects.xml
  def index
    if params[:q].present?
			list = params[:q].split("\n")
			q = list.last
			@effects = Effect.find(:all, :conditions => ['description LIKE ?', "#{q}%"], :order => 'description') || Array.new
			@effects.delete_if { |effect| list.detect { |entry| entry == effect.description } }
		else
			@effects = Effect.find(:all, :order => 'description')
		end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @effects }
			format.js { 
			  if params[:q].present? 
			    render 'index.js.rjs' 
			  else 
			    render :partial => 'selector'
			  end
			} 
    end
  end

  # GET /effects/1
  # GET /effects/1.xml
  def show
    @effect = Effect.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @effect }
    end
  end

  # GET /effects/new
  # GET /effects/new.xml
  def new
    @effect = Effect.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @effect }
    end
  end

  # GET /effects/1/edit
  def edit
    @effect = Effect.find(params[:id])
  end

  # POST /effects
  # POST /effects.xml
  def create
    @effect = Effect.new(params[:effect])

    respond_to do |format|
      if @effect.save
        flash[:notice] = 'Effect was successfully created.'
        format.html { redirect_to(@effect) }
        format.xml  { render :xml => @effect, :status => :created, :location => @effect }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @effect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /effects/1
  # PUT /effects/1.xml
  def update
    @effect = Effect.find(params[:id])

    respond_to do |format|
      if @effect.update_attributes(params[:effect])
        flash[:notice] = 'Effect was successfully updated.'
        format.html { redirect_to(@effect) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @effect.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /effects/1
  # DELETE /effects/1.xml
  def destroy
    @effect = Effect.find(params[:id])
    @effect.destroy

    respond_to do |format|
      format.html { redirect_to(effects_url) }
      format.xml  { head :ok }
    end
  end
end
