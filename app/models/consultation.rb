class Consultation < ActiveRecord::Base
  belongs_to :user
  has_one :location, :as => :locatable
  acts_as_mappable :through => :location
  has_many :consultation_photos
  has_many :events
  
  after_validation :set_pro_start_date
  before_create :create_reference_number
  
  accepts_nested_attributes_for :location, :allow_destroy => true
  accepts_nested_attributes_for :consultation_photos, :allow_destroy => true, :reject_if  => proc {|attributes| attributes['uploaded_data'].blank? }
  
  private 
  
  def set_pro_start_date
    if pro && pro_changed?
      self.pro_start_day_will_change!
      self.pro_start_day = Date.current.day()
    end
  end
  
  def create_reference_number
    self.pro_identifier_will_change!
    self.pro_identifier = "#{user_id}_#{title.hash}"
  end
end
