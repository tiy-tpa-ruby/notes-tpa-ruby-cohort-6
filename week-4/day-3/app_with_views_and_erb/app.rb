require 'sinatra'

get '/' do
  @word = params["word"]

  erb :home
end
