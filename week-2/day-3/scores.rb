scores = File.read("scores.txt").split("\n")

loop do
  puts "What is your score?"
  score = gets.chomp

  if score == ""
    puts "Thanks, all done"
    break
  end

  scores << score
end

File.write("scores.txt", scores.join("\n"))

puts "The person has #{scores.inspect} scores"
