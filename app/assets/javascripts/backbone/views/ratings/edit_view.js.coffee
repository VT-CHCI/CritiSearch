Platypus.Views.Ratings ||= {}

class Platypus.Views.Ratings.EditView extends Backbone.View
  template : JST["backbone/templates/ratings/edit"]

  events :
    "submit #edit-rating" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (rating) =>
        @model = rating
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
