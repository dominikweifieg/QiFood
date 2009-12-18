class LocationsController < ApplicationController
  def index
    if params[:ids].present?
      @locations = Location.find(params[:ids])
    elsif current_user && current_user.location
      @locations = Location.find(:all, :origin => current_user.location, :within => params[:radius])
    else
      @locations = Location.find(:all, :origin => params[:origin], :within => params[:radius])
    end
    
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    min_lat = 0.0
    max_lat = 0.0
    min_lng = 0.0
    max_lng = 0.0
    @locations.each do |location|
      @map.overlay_init(GMarker.new([location.lat,location.lng],:title => location.locatable.title, :info_window => location.locatable.title + "<br/>" + location.address("<br/>")))
      min_lat = location.lat if location.lat < min_lat or min_lat == 0.0
      max_lat = location.lat if location.lat > max_lat
      min_lng = location.lng if location.lng < min_lng or min_lng == 0.0
      max_lng = location.lng if location.lng > max_lng
    end
    sw = GeoKit::LatLng.new(min_lat, min_lng)
    ne = GeoKit::LatLng.new(max_lat, max_lng)
    distance = sw.distance_to(ne)
    zoom = (distance / 15).to_i
    logger.info { "#{distance}" }
    center = GeoKit::Bounds.new(sw, ne).center
    @map.center_zoom_init([center.lat,center.lng],zoom)
    
    respond_to do |wants|
      wants.html {  }
    end
  end

  def show
    @location = Location.find(params[:id])
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([@location.lat,@location.lng],14)
    info = params[:info]
    info = info + "<br />" + @location.address("<br />")
    @map.overlay_init(GMarker.new([@location.lat,@location.lng],:title => params[:title], :info_window => info))
    respond_to do |wants|
      wants.html {  }
    end
  end

end
