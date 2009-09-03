class UserPhoto < ActiveRecord::Base
  belongs_to :user
  
  has_attachment	:content_type => :image,
									:storage => :file_system,
									:max_size => 1.megabytes,
									:resize_to => '300x300>',
									:thumbnails => {:thumb => '100x100>'}

	validates_as_attachment
end
