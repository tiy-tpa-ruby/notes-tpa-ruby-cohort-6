require 'sinatra'

get '/' do
  erb :home
end

# User *LINKS* to the show URL
get '/show' do
  erb :show
end

# User does a *POST* for the FORM to the show URL
post '/show' do
  @word = params["word"]

  erb :show
end
