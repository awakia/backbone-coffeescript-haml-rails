BackboneCoffeescriptHamlRails.Views.Cars ||= {}

class BackboneCoffeescriptHamlRails.Views.Cars.NewView extends Backbone.View
  template: JST["backbone/templates/cars/new"]

  events:
    "submit #new-car": "save"

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
      success: (car) =>
        @model = car
        window.location.hash = "/#{@model.id}"

      error: (car, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
