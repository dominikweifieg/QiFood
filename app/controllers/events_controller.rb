class EventsController < ApplicationController

  before_filter :login_required, :except => [:index, :show]
  before_filter :fetch_user_and_consultation

  # GET /events
  # GET /events.xml
  def index
    today = Date.current
    params[:month] ||= today.month
    year = today.year
    year = year + 1 if params[:month].to_i < today.month
    search_start = DateTime.civil(year, params[:month].to_i)
    if today > search_start
      search_start = today
      if today.day > 20
        search_end = search_start.next_month
      end
    else
      search_start = search_start.beginning_of_month
    end
    search_end ||= search_start
    if params[:origin].present?
      @events = Event.paginate(:origin => params[:origin], :within => params[:radius], :conditions => ["start BETWEEN :month_start AND :month_end", 
        { :month_start => search_start.to_formatted_s(:db), 
          :month_end => search_end.end_of_month.to_formatted_s(:db)}], :order => "start", :page => params[:page])
    else
      @events = Event.paginate(:conditions => ["start BETWEEN :month_start AND :month_end", 
        { :month_start => search_start.to_formatted_s(:db), 
          :month_end => search_end.end_of_month.to_formatted_s(:db)}], :order => "start", :page => params[:page])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    attach_location
    @event.end = 90.minutes.from_now
    logger.info @event.location
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    if @consultation 
      @event = @consultation.events.find(params[:id])
    else
      @event = @user.events.find(params[:id])
    end
    @event.location ||= Location.new
  end

  # POST /events
  # POST /events.xml
  def create
    if @consultation
      @event = @consultation.events.build(params[:event])
    else
      @event = @user.events.build(params[:event])
    end

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    if @consultation
      @event = @consultation.events.find(params[:id])
    else
      @event = @user.events.find(params[:id])
    end

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    if @consultation
      @event = @consultation.events.find(params[:id])
    else
      @event = @user.events.find(params[:id])
    end
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  private 
  def fetch_user_and_consultation
    if params[:consultation_id].present?
      @consultation = Consultation.find(params[:consultation_id])
      @user = @consultation.user
      @parent = @consultation
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      @parent = @user
    else
      @user = current_user
      @parent = @user
    end
  end
  
  def attach_location
    if @consultation
      @event.location = @consultation.location.clone if @consultation.location
      @event.commercial = true
    elsif @user.location
      @event.location = @user.location.clone
    end
    unless @event.location 
      @event.location = Location.new
    end
  end
end
