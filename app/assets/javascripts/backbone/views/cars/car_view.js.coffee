BackboneCoffeescriptHamlRails.Views.Cars ||= {}

class BackboneCoffeescriptHamlRails.Views.Cars.CarView extends Backbone.View
  template: JST["backbone/templates/cars/car"]

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
