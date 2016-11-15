class Dog
  attr_accessor :name, :age_in_years, :age_in_months, :toys

  # Using unique names for the arguments for clarity
  # def initialize(name, dogs_age_years, dogs_age_months)
  #   @name = name
  #   @age_in_years = dogs_age_years
  #   @age_in_months = dogs_age_months
  #   @toys = []
  # end

  def initialize(name, age_in_years, age_in_months)
    @name = name
    @age_in_years = age_in_years
    @age_in_months = age_in_months
    @toys = []
  end

  def how_many_toys
    toys.length
  end

  def age
    return "#{name} is #{age_in_years} years and #{age_in_months} months, which is #{age_in_days} days, and has #{how_many_toys} toys"
  end

  def age_in_days
    age_in_years * 365 + age_in_months * 31
  end
end

class Cat
  attr_accessor :name, :age_in_years, :age_in_months

  def initialize(name)
    @name = name
  end

  def age
    return "#{name} is #{age_in_years} years and #{age_in_months} months"
  end

  def meow
    puts "Meow!"
  end

  def scratch
  end
end

artemis = Cat.new("Artemis")
artemis.age_in_years = 3
artemis.age_in_months = 2
p artemis.age

riley = Dog.new("Riley", 1, 5)
# `getter` method for `name`
p riley.name
riley.toys << "Favorite Sock"
riley.toys << "Favorite Shoe"
riley.toys << 42
p riley.toys
riley.toys << "Remote Control"
p riley.toys

# `setter` method for `name`
riley.name = "Best Riley Dog"
p riley.name

p riley.age
p riley.age_in_years
p riley.age_in_months
p riley.age_in_days

roxy = Dog.new("Roxy", 7, 3)
p roxy.name
p roxy.age
p roxy.age_in_days


puts "Riley age in days: #{riley.age_in_days}"
puts "Roxy  age in days: #{roxy.age_in_days}"
