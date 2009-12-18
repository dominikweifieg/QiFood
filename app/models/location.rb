class Location < ActiveRecord::Base
  belongs_to :locatable, :polymorphic => true
  acts_as_mappable  :default_units => :kms, 
                    :default_formula => :sphere
                    
  before_validation_on_create :geocode_location
  
  def address(separator=",")
    if state
      "#{street} #{number}#{separator} #{zip} #{city}#{separator} #{state}#{separator} #{I18n.t(country, :scope => 'countries')}" 
    else
      "#{street} #{number}#{separator} #{zip} #{city}#{separator} #{I18n.t(country, :scope => 'countries')}" 
    end
  end
  
  private 
  def geocode_location
    geo=Geokit::Geocoders::MultiGeocoder.geocode (address)
    errors.add(:street, t('location.could_not_geocode')) if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end
end
