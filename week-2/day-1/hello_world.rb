puts "What is your name?"
name = gets.chomp

scores = []

loop do
  puts "What is your score?"
  score = gets.chomp

  if score == ""
    puts "Thanks, all done"
    break
  end

  scores << score
end

puts "The person #{name.inspect} has #{scores.inspect} scores"
