BackboneCoffeescriptHamlRails.Views.Cars ||= {}

class BackboneCoffeescriptHamlRails.Views.Cars.EditView extends Backbone.View
  template : JST["backbone/templates/cars/edit"]

  events :
    "submit #edit-car" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (car) =>
        @model = car
        window.location.hash = "/#{@model.id}"
      error : (msg) =>
        alert (msg)
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
