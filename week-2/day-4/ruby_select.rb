movies = [
  "The Karate Kid",
  "Weird Science",
  "Better Off Dead",
  "Real Science",
  "The Princess Bride",
  "Ferris Bueller's Day Off"
]

found_movies = movies.select do |movie|
  movie.include?("O")
end

count_of_movies_with_O = movies.count do |movie|
  movie.include?("O")
end

puts "There are #{count_of_movies_with_O} movies with the letter O"

longest_movie_title = movies.max_by do |movie|
  movie.length
end
puts "The longest movie title is #{longest_movie_title}"

shortest_movie_title = movies.min_by do |movie|
  movie.length
end
puts "The shortest movie title is #{shortest_movie_title}"

truth = movies.all? do |movie|
  movie.include?(" ")
end

if truth
  puts "Yup, all the movies have a space in them!"
end

backward_movie_titles = movies.map do |movie|
  movie.reverse
end
p backward_movie_titles

truth = movies.any? do |movie|
  movie.include?("X")
end

if truth
  puts "There is a movie with the letter X"
else
  puts "There is not a movie with the letter X"
end



#
