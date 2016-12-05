require "sinatra"
require "sinatra/reloader" if development?
require "pg"

get "/" do
  erb :home
end

get "/employees" do
  database = PG.connect(dbname: 'tiy-database')
  @rows = database.exec('SELECT * FROM employees')

  erb :employees
end

get "/new_employee" do
  erb :new_employee
end

post "/create_employee" do
  name = params["name"]
  address = params["address"]
  phone = params["phone"]
  salary = params["salary"]
  position = params["position"]
  github = params["github"]
  slack = params["slack"]

  database = PG.connect(dbname: "tiy-database")
  database.exec("INSERT INTO employees(name, address, phone, salary, position, github, slack) VALUES($1, $2, $3, $4, $5, $6, $7)",[name, address, phone, salary, position, github, slack])

  redirect to("/employees")
end
