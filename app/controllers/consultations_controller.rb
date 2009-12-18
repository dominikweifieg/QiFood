class ConsultationsController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show]
  before_filter :fetch_user
  
  # GET /consultations
  # GET /consultations.xml
  def index
    if params[:origin].present?
      @consultations = Consultation.paginate(:all, :origin => params[:origin], :within => params[:radius], :page => params[:page], :order => "pro DESC")
      @loc = params[:origin]
    elsif @user && @user.location#if a user id was given, we search for consultations near that user
      @consultations = Consultation.paginate(:all, :origin => @user.location, :within => params[:radius], :page => params[:page], :order => "pro DESC")
      @loc = @user.location.address
    else
      @consultations = Consultation.paginate(:page => params[:page], :order => "pro DESC, title")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consultations }
    end
  end

  # GET /consultations/1
  # GET /consultations/1.xml
  def show
    @consultation = Consultation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consultation }
    end
  end

  # GET /consultations/new
  # GET /consultations/new.xml
  def new
    @consultation = Consultation.new
    if @user.location
      @consultation.location = @user.location.clone
    else
      @consultation.location = Location.new
    end
    5.times do
      @consultation.consultation_photos << ConsultationPhoto.new
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consultation }
    end
  end

  # GET /consultations/1/edit
  def edit
    @consultation = @user.consultation
    photo_count = @consultation.consultation_photos.size
    (5 - photo_count).times {@consultation.consultation_photos << ConsultationPhoto.new}
  end

  # POST /consultations
  # POST /consultations.xml
  def create
    @consultation = @user.build_consultation(params[:consultation])

    respond_to do |format|
      if @consultation.save
        flash[:notice] = 'Consultation was successfully created.'
        format.html { redirect_to(@consultation) }
        format.xml  { render :xml => @consultation, :status => :created, :location => @consultation }
      else
        @consultation.errors.each {|e| logger.error e}
        format.html { render :action => "new" }
        format.xml  { render :xml => @consultation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consultations/1
  # PUT /consultations/1.xml
  def update
    @consultation = @user.consultation

    respond_to do |format|
      if @consultation.update_attributes(params[:consultation])
        flash[:notice] = 'Consultation was successfully updated.'
        format.html { redirect_to(@consultation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consultation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.xml
  def destroy
    if current_user.admin?
      @consultation = Consultation.find(params[:id])
      @consultation.destroy

      respond_to do |format|
        format.html { redirect_to(consultations_url) }
        format.xml  { head :ok }
      end
    end
  end
  
  private
  
  def fetch_user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    end
  end
end
