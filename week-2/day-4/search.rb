def search_length(movies, movie_name_length)
  matches = []
  index = 0
  loop do
    if index >= movies.length
      break
    end

    if movies[index].length >= movie_name_length
      matches << movies[index]
    end

    index = index + 1
  end

  return matches
end


movies = [
  "The Karate Kid",
  "Weird Science",
  "Better Off Dead",
  "Real Science",
  "The Princess Bride",
  "Ferris Bueller's Day Off"
]

long_movies = search_length(movies, 34)
p long_movies
