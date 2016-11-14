puts "What is your name?"
name = gets.chomp

scores = []

loop do
  puts "What is your score?"
  score = gets.chomp
  scores << score

  if score == ""
    puts "Thanks, all done"
    break
  end

end

puts "The person #{name.inspect} has #{scores.inspect} scores"
