class Book < ActiveRecord::Base
  has_many :authorships
  has_many :linked_authors, :through => :authorships, :source => 'user'
  
  def self.per_page
    10
  end
end
