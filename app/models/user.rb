require 'digest/sha1'

class User < ActiveRecord::Base
  acts_as_authentic

  has_one :profile
  has_one :user_photo
  
  has_many :favorite_aliments
  has_many :aliments, :through => :favorite_aliments
  
  has_many :friendships
  has_many :friends, :through => :friendships
  
  has_many :posts

	can_flag

  #validates_presence_of     :login
  #validates_length_of       :login,    :within => 3..40
  #validates_uniqueness_of   :login
  #validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message
  
  #validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  #validates_length_of       :name,     :maximum => 100
  
  #validates_presence_of     :email
  #validates_length_of       :email,    :within => 6..100 #r@a.wk
  #validates_uniqueness_of   :email
  #validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  accepts_nested_attributes_for :profile, :user_photo, :allow_destroy => true

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  #attr_accessible :login, :email, :name, :password, :password_confirmation, :profile_attributes, :user_photo_attributes, :persistence_token

  GUEST			= 1
	USER			= 2 + GUEST
	EDITOR		= 4 + USER
	ADMIN			= 8 + EDITOR
	SUBSCRIBER = 16


  
  #def login=(value)
  #  write_attribute :login, (value ? value.downcase : nil)
  #end
  #
  #def email=(value)
  #  write_attribute :email, (value ? value.downcase : nil)
  #end
  #
  #def persistence_token=(value)
  #  write_attribute :persistence_token, value
  #end

	def admin?
		role & ADMIN == ADMIN
	end

  def to_param
    "#{id}_#{login.parameterize}"
  end

end
