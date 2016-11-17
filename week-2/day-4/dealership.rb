require 'csv'

class Dealership
  def initialize
    @cars = []

    CSV.foreach("cars.csv", headers:true) do |car|
      brand = car["brand"]
      model = car["model"]
      color = car["color"]

      add_to_inventory(brand, model, color)
    end
  end

  def save_inventory
    csv = CSV.open("cars.csv", "w")
    csv.add_row ["brand", "model", "color"]

    @cars.each do |car|
      csv.add_row [car.brand, car.model, car.color]
    end

    csv.close
  end

  def print_inventory
    @cars.each do |car|
      puts "We have a #{car.model} from #{car.brand} that is #{car.color}"
    end
  end

  def add_to_inventory(brand, model, color)
    car = Car.new
    car.brand = brand
    car.model = model
    car.color = color

    @cars << car
  end

  # Return all the cars of this brand
  def search(brand)
    found_cars = @cars.select { |car| car.brand == brand }

    return found_cars
  end
end
