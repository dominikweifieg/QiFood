class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable, :order => 'created_at DESC'
  
  validates_presence_of :title
  validates_presence_of :body
  validates_uniqueness_of :permalink, :on => :create
  
  default_scope :conditions => {:lang => "#{I18n.locale}"}, :order => 'created_at DESC'
  
  def to_param
    "#{id}_#{permalink}"
  end
end
