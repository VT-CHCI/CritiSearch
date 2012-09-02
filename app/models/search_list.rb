class SearchList < ActiveRecord::Base
  has_many :search_items, dependent: :destroy
  belongs_to :person

  has_paper_trail
end
