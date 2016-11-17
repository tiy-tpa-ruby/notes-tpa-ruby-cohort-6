require_relative 'car'
require_relative 'dealership'

my_dealership = Dealership.new

puts "Brand? "
brand = gets.chomp

puts "Model? "
model = gets.chomp

puts "Color? "
color = gets.chomp
my_dealership.add_to_inventory(brand, model, color)

teslas = my_dealership.search("Tesla")
teslas.each do |car|
  puts car.description
end

hondas = my_dealership.search("Honda")
hondas.each do |car|
  puts car.description
end

my_dealership.save_inventory
#
