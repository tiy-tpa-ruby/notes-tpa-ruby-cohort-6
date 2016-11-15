score = 42
name = "Gavin"

# if the score is between 10 and 80 then print
if score > 10 && score < 80
  puts "Is between"
end

# if the score is more than 90, OR the person is Gavin
# they get an "A"
p score > 90 || name == "Gavin"

if score > 90 || name == "Gavin"
  puts "They get an A"
end

today = "Tuesday"
if (score > 90 || name == "Gavin") && today == "Wednesday"
  puts "They get an A"
end

name = "Holly"
case name
  when "Gavin", "Mark", "Jason"
    puts "Instructor"
  when "Dania", "Holly"
    puts "Ops"
  when "Toni"
    puts "Campus Director"
  when ""
    puts "No name given!"
  else
    puts "You gave me a name that I don't know"
end
