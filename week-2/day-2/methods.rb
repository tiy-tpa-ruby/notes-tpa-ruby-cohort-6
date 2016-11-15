def prompt_user_for_input(question)
  # fancy prompt with color
  # print "\033[31m#{question}\033[0m : "
  print "#{question} : "

  gets.chomp
end

name = prompt_user_for_input("What is your name?")

scores = []

loop do
  score = prompt_user_for_input("What is your score?")

  if score == ""
    puts "Thanks, all done"
    break
  end

  scores << score
end

puts "The person #{name.inspect} has #{scores.inspect} scores"
