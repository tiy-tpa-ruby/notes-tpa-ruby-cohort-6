require 'sinatra'
require 'pg'

get '/' do
  erb :home
end

get '/show' do
  database = PG.connect(dbname: "words")
  @rows = database.exec("SELECT * FROM words")

  erb :show
end

post '/show' do
  word = params["word"]

  database = PG.connect(dbname: "words")

  # Never do this (string interpolation), or someone will fire you.
  # See: https://xkcd.com/327/
  # database.exec(%{INSERT INTO words(word) VALUES("#{word}")}, [word])

  # Use SQL variables to specify our data, safe from SQL Injection
  database.exec(%{INSERT INTO words(word) VALUES($1)}, [word])

  # Load the words
  @rows = database.exec("SELECT * FROM words")

  erb :show
end
