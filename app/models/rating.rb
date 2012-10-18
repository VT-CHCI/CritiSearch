class Rating < ActiveRecord::Base
  belongs_to :search_item
  belongs_to :rating_value
end
