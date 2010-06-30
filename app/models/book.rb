class Book < ActiveRecord::Base
  has_many :authorships
  has_many :linked_authors, :through => :authorships, :source => 'user'
  
  default_scope :conditions => {:language => "#{I18n.locale}"}
  
  def self.per_page
    10
  end
end
