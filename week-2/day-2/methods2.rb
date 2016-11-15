# The purpose of this method is just to output
# something to the screen
def say_hello
  puts "Hello There!"
end

# The purpose of this method is to take a name
# and print a welcome message to the screen
def say_hello_to(name)
  puts "Hello There #{name}!"
end

# The purpose of this method is to make a new sentence
# for the name and the score provided and RETURN it
def make_hello_sentence(person_name, score)
  "Hello there #{person_name} you scored #{score}"
end

name = "Gavin"
say_hello
say_hello_to(name)

# Get the sentence made from Toni's name and her score
# and store it in the variable `new_sentence`
new_sentence = make_hello_sentence("Toni", 42)
# Print out that sentence
puts new_sentence
