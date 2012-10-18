class Platypus.Routers.RatingsRouter extends Backbone.Router
  initialize: (options) ->
    @ratings = new Platypus.Collections.RatingsCollection()
    @ratings.reset options.ratings

  routes:
    "new"      : "newRating"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newRating: ->
    @view = new Platypus.Views.Ratings.NewView(collection: @ratings)
    $("#ratings").html(@view.render().el)

  index: ->
    @view = new Platypus.Views.Ratings.IndexView(ratings: @ratings)
    $("#ratings").html(@view.render().el)

  show: (id) ->
    rating = @ratings.get(id)

    @view = new Platypus.Views.Ratings.ShowView(model: rating)
    $("#ratings").html(@view.render().el)

  edit: (id) ->
    rating = @ratings.get(id)

    @view = new Platypus.Views.Ratings.EditView(model: rating)
    $("#ratings").html(@view.render().el)
