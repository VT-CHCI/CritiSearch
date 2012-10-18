Platypus.Views.Ratings ||= {}

class Platypus.Views.Ratings.ShowView extends Backbone.View
  template: JST["backbone/templates/ratings/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
