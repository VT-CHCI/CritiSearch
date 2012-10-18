Platypus.Views.Ratings ||= {}

class Platypus.Views.Ratings.IndexView extends Backbone.View
  template: JST["backbone/templates/ratings/index"]

  initialize: () ->
    @options.ratings.bind('reset', @addAll)

  addAll: () =>
    @options.ratings.each(@addOne)

  addOne: (rating) =>
    view = new Platypus.Views.Ratings.RatingView({model : rating})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(ratings: @options.ratings.toJSON() ))
    @addAll()

    return this
