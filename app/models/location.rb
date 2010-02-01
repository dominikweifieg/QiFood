class Location < ActiveRecord::Base
  belongs_to :locatable, :polymorphic => true
  acts_as_mappable  :default_units => :kms, 
                    :default_formula => :sphere
                    
  before_save :geocode_location
  
  def address(separator=",")
    unless state && state.empty?
      "#{street} #{number}#{separator} #{zip} #{city}#{separator} #{state}#{separator} #{country}" 
    else
      "#{street} #{number}#{separator} #{zip} #{city}#{separator} #{country}" 
    end
  end
  
  private 
  def geocode_location
    
    geo=Geokit::Geocoders::MultiGeocoder.geocode(address)
    errors.add(:street, t('location.could_not_geocode')) if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end
