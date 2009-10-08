class AlimentsController < ApplicationController

  before_filter :login_required, :check_editor_access, :except => [:index, :show]
	# GET /aliments
  # GET /aliments.xml
  def index
		sort = params[:sort_by] || 'name'
		sort_by = sort + ' ' + (params[:sort_dir] || '')
		if not params[:effects].blank?
			@aliments = Aliment.sorted(sort_by).paginate_all_by_effects(params, :page => params[:page], 
																																	:total_entries => Aliment.count_all_by_effects(params))
		elsif other_search? params
			@aliments = Aliment.sorted(sort_by).paginate_all_by_parameters(params, :page => params[:page],
																																	 :total_entries => Aliment.count_all_by_parameters(params))
		else
	    @aliments = Aliment.sorted(sort_by).paginate(:page => params[:page])
		end
    
    logger.error(@aliments.size)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aliments }
      format.js #index.js.rjs
    end
  end

  # GET /aliments/1
  # GET /aliments/1.xml
  def show
    @aliment = Aliment.find(params[:id], :include => [:effects, :organs, :comments, :aliment_photo])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aliment }
    end
  end

  # GET /aliments/new
  # GET /aliments/new.xml
  def new
    @aliment = Aliment.new
		if(@aliment.aliment_photo == nil)
			@aliment.aliment_photo = AlimentPhoto.new
		end


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aliment }
    end
  end

  # GET /aliments/1/edit
  def edit
    @aliment = Aliment.find(params[:id])
		if(@aliment.aliment_photo == nil)
			@aliment.aliment_photo = AlimentPhoto.new
		end

  end

  # POST /aliments
  # POST /aliments.xml
  def create
    @aliment = Aliment.new(params[:aliment])
		
		unless params[:organs].blank?
			@aliment.organs = Organ.find(params[:organs])
		end
		
		update_effects

    respond_to do |format|
      if @aliment.save
        flash[:notice] = 'Aliment was successfully created.'
        format.html { redirect_to(@aliment) }
        format.xml  { render :xml => @aliment, :status => :created, :location => @aliment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aliment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aliments/1
  # PUT /aliments/1.xml
  def update
    @aliment = Aliment.find(params[:id])

		update_effects

		unless params[:organs].blank?
			@aliment.organs = Organ.find(params[:organs])
		end

    respond_to do |format|
      if @aliment.update_attributes(params[:aliment])
        flash[:notice] = 'Aliment was successfully updated.'
        format.html { redirect_to(@aliment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aliment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aliments/1
  # DELETE /aliments/1.xml
  def destroy
    @aliment = Aliment.find(params[:id])
    @aliment.destroy

    respond_to do |format|
      format.html { redirect_to(aliments_url) }
      format.xml  { head :ok }
    end
  end
	
	private 
	def other_search?(params)
	  params[:name].present? || params[:latin_name].present? || params[:pinyin].present? \
				 || params[:chinese].present? || (params[:aliment].present? && (params[:aliment][:savor].present? \
				 || params[:aliment][:temperature].present?)) || params[:description].present? \
				 || params[:category].present?
	end
	
	def update_effects
	  unless params[:effects].empty?
			effects_in = params[:effects].split("\n").map {|ef|ef.strip} 
			effects = Effect.find(:all, :conditions => {:description => effects_in})
			effects_in.delete_if{ |effect| effects.detect {|found_effect| found_effect.description == effect}}
			unless effects_in.empty?
				effects_in.each do |desc|
					effects << Effect.create!(:description => desc)
				end
			end
			@aliment.effects = effects
		end
	end
end
