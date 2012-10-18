Platypus.Views.Ratings ||= {}

class Platypus.Views.Ratings.RatingView extends Backbone.View
  template: JST["backbone/templates/ratings/rating"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
