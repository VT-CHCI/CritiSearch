Platypus.Views.Ratings ||= {}

class Platypus.Views.Ratings.NewView extends Backbone.View
  template: JST["backbone/templates/ratings/new"]

  events:
    "submit #new-rating": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (rating) =>
        @model = rating
        window.location.hash = "/#{@model.id}"

      error: (rating, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
