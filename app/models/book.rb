class Book < ActiveRecord::Base
  has_many :authorships
  has_many :linked_authors, :through => :authorships, :source => 'user'
end
