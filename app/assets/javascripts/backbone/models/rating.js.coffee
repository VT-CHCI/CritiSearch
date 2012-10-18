class Platypus.Models.Rating extends Backbone.Model
  paramRoot: 'rating'

  defaults:
    search_item: null
    url: null
    rating_value: null

class Platypus.Collections.RatingsCollection extends Backbone.Collection
  model: Platypus.Models.Rating
  url: '/ratings'
