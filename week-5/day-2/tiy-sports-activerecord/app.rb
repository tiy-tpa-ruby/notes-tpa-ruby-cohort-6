require 'sinatra'
require 'pg'
require 'active_record'
require "sinatra/reloader" if development?

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "tiy-sports"
)

class Team < ActiveRecord::Base
  self.primary_key = "id"

  has_many :memberships
  has_many :players, through: :memberships
end

class Player < ActiveRecord::Base
  self.primary_key = "id"

  has_many :memberships
  has_many :teams, through: :memberships
end

class Membership < ActiveRecord::Base
  self.primary_key = "id"

  belongs_to :team
  belongs_to :player
end

if false
# Sinatra code starts here

# This magic tells Sinatra to close the database connection
# after each request
after do
  ActiveRecord::Base.connection.close
end

# Number of Teams
get '/' do
  @teams = Team.all

  erb :home
end

end






#
