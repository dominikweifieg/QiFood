class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :consultation
  
  has_one :location, :as => :locatable
  acts_as_mappable :through => :location

  accepts_nested_attributes_for :location, :allow_destroy => true
  
  before_create :create_reference_number
  
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :start
  validates_presence_of :end
  validate do |event|
    event.errors.add(:start, :past) unless event.start.future?
    event.errors.add(:start, :after_end) unless event.start < event.end
  end
  
  private 
    
  def create_reference_number
    self.reference_number_will_change!
    if consultation_id
      self.reference_number = "#{consultation_id}_#{title.hash}"
    else
      self.reference_number = "#{user_id}_#{title.hash}"  
    end
  end
  
end
