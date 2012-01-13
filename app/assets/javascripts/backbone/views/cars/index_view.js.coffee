BackboneCoffeescriptHamlRails.Views.Cars ||= {}

class BackboneCoffeescriptHamlRails.Views.Cars.IndexView extends Backbone.View
  template: JST["backbone/templates/cars/index"]

  initialize: () ->
    @options.cars.bind('reset', @addAll)

  addAll: () =>
    @options.cars.each(@addOne)

  addOne: (car) =>
    view = new BackboneCoffeescriptHamlRails.Views.Cars.CarView({model : car})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(cars: @options.cars.toJSON() ))
    @addAll()

    return this
