require 'sinatra'

#                        params
#                          |
#                          |
# http://localhost:4567/?word=JavaScript
get '/' do
  # Get the word query parameter from the params `hash`
  @user_word = params["word"]

  erb :home
end
