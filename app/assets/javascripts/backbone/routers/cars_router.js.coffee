class BackboneCoffeescriptHamlRails.Routers.CarsRouter extends Backbone.Router
  initialize: (options) ->
    @cars = new BackboneCoffeescriptHamlRails.Collections.CarsCollection()
    @cars.reset options.cars

  routes:
    "/new"      : "newCar"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newCar: ->
    @view = new BackboneCoffeescriptHamlRails.Views.Cars.NewView(collection: @cars)
    $("#cars").html(@view.render().el)

  index: ->
    @view = new BackboneCoffeescriptHamlRails.Views.Cars.IndexView(cars: @cars)
    $("#cars").html(@view.render().el)

  show: (id) ->
    car = @cars.get(id)

    @view = new BackboneCoffeescriptHamlRails.Views.Cars.ShowView(model: car)
    $("#cars").html(@view.render().el)

  edit: (id) ->
    car = @cars.get(id)

    @view = new BackboneCoffeescriptHamlRails.Views.Cars.EditView(model: car)
    $("#cars").html(@view.render().el)
