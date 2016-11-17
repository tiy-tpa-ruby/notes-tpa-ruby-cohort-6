def array_each(array)
  index = 0
  loop do
    if index >= array.length
      break
    end

    element = array[index]
    yield element

    index = index + 1
  end
end

scores = [100, 42, 65, 12, 84]

# Ruby way
scores.each do |score|
  puts "The score is #{score}"
end

# Our example way of writing it ourselves
array_each(scores) do |score|
  puts "The score is #{score}"
end

class Dog
  attr_accessor :name
end

dogs = []

dog = Dog.new
dog.name = "Riley"
dogs << dog

dog = Dog.new
dog.name = "Roxy"
dogs << dog

dogs.each do |dog|
  puts "This dog is #{dog.name}"
end



#
