class BackboneCoffeescriptHamlRails.Models.Car extends Backbone.Model
  paramRoot: 'car'

  defaults:
    make: null
    model: null

class BackboneCoffeescriptHamlRails.Collections.CarsCollection extends Backbone.Collection
  model: BackboneCoffeescriptHamlRails.Models.Car
  url: '/cars'
