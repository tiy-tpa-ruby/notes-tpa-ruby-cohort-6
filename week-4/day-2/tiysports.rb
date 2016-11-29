require 'pg'

# Connect to my database
database = PG.connect(dbname: "sample_database")

# Execute a SQL command and get back some rows
rows = database.exec("select * from players")

# Iterate over those rows
rows.each do |row|
  puts "There is a player named #{row["name"]} that lives at #{row["address"]} who is #{row["age"]} and wears a size #{row["shirt_size"]}"
end

puts
puts "Here is some information about mascots"
puts

rows = database.exec("select players.name, teams.mascot from players, teams, memberships where players.id = memberships.player_id AND teams.id = memberships.team_id;")

rows.each do |row|
  puts "The player named #{row["name"]} hangs out with #{row["mascot"]}"
end





#
