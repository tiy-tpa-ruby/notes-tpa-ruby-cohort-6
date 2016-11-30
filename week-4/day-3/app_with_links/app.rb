require 'sinatra'

get '/' do
  erb :home
end

get '/show' do
  @word = params["word"]
  erb :show
end
