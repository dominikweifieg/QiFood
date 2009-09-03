class FavoriteAliment < ActiveRecord::Base
  belongs_to :user
  belongs_to :aliment
end
