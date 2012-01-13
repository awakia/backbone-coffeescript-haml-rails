BackboneCoffeescriptHamlRails.Views.Cars ||= {}

class BackboneCoffeescriptHamlRails.Views.Cars.ShowView extends Backbone.View
  template: JST["backbone/templates/cars/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
