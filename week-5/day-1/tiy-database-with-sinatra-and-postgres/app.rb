require "sinatra"
require "sinatra/reloader" if development?
require "pg"
require "active_record"

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "tiy-database"
)

class Employee < ActiveRecord::Base
  self.primary_key = :id

  def monthly_salary
    salary / 12.0
  end
end

# Sinatra code starts here

# This magic tells Sinatra to close the database connection
# after each request
after do
  ActiveRecord::Base.connection.close
end

get "/" do
  erb :home
end

get "/employees" do
  @employees = Employee.all

  erb :employees
end

get "/new_employee" do
  erb :new_employee
end

post "/create_employee" do
  Employee.create(params)

  redirect to("/employees")
end

get '/show_employee' do
  @employee = Employee.find(params["id"])

  erb :employee
end

get '/edit_employee' do
  @employee = Employee.find(params["id"])

  erb :edit_employee
end

post '/update_employee' do
  employee = Employee.find(params["id"])

  employee.update_attributes(params)
  # Update attributes does this
  #          |
  #          |
  #          v
  #employee.name = params["name"]
  #employee.address = params["address"]
  #employee.phone = params["phone"]
  #employee.salary = params["salary"]
  #employee.position = params["position"]
  #employee.github = params["github"]
  #employee.slack = params["slack"]
  #employee.save

  redirect to("/employees")
end

get '/search_employee' do
  @employees = Employee.where(name: params["search"])

  # This would be partial match
  # @employees = Employee.where("name like ?", "%#{params["search"]}%")

  erb :employees
end

get '/delete_employee' do
  employee = Employee.find(params["id"])
  employee.delete

  redirect to('/employees')
end

#class Employee
#  attr_accessor :name, :phone, :address, :salary, :position, :slack, :github, :id
#
#  def monthly_salary
#    return salary / 12.0
#  end
#
#  def save
#    database = PG.connect(dbname: "tiy-database")
#    database.exec('UPDATE employees SET name = $1, address = $2, phone = $3, salary = $4, position = $5, github = $6, slack = $7 WHERE id = $8',
#                  # $1     $2       $3     $4       $5       $6     $7    $8
#                  [name, address, phone, salary, position, github, slack, id])
#  end
#
#  def delete
#    database = PG.connect(dbname: "tiy-database")
#    database.exec('delete FROM employees WHERE id = $1',[id])
#  end
#
#  def self.find(id)
#    database = PG.connect(dbname: "tiy-database")
#    rows = database.exec("SELECT * FROM employees WHERE id = $1", [id])
#
#    row = rows.first
#
#    employee = Employee.new
#    employee.id = row["id"]
#    employee.name = row["name"]
#    employee.phone = row["phone"]
#    employee.address = row["address"]
#    employee.salary = row["salary"].to_i
#    employee.position = row["position"]
#    employee.slack = row["slack"]
#    employee.github = row["github"]
#
#    return employee
#  end
#
#  def self.create(name, address, phone, salary, position, github, slack)
#    database = PG.connect(dbname: "tiy-database")
#    database.exec("INSERT INTO employees(name, address, phone, salary, position, github, slack) VALUES($1, $2, $3, $4, $5, $6, $7)",[name, address, phone, salary, position, github, slack])
#  end
#
#  def self.where(name)
#    database = PG.connect(dbname: 'tiy-database')
#
#    rows = database.exec('SELECT * FROM employees WHERE name = $1', [name])
#
#    employees = []
#    rows.each do |row|
#      employee = Employee.new
#      employee.id = row["id"]
#      employee.name = row["name"]
#      employee.phone = row["phone"]
#      employee.address = row["address"]
#      employee.salary = row["salary"].to_i
#      employee.position = row["position"]
#      employee.slack = row["slack"]
#      employee.github = row["github"]
#
#      employees << employee
#    end
#
#    return employees
#  end
#
#  def self.all
#    database = PG.connect(dbname: 'tiy-database')
#    rows = database.exec('SELECT * FROM employees')
#
#    employees = []
#    rows.each do |row|
#      employee = Employee.new
#      employee.id = row["id"]
#      employee.name = row["name"]
#      employee.phone = row["phone"]
#      employee.address = row["address"]
#      employee.salary = row["salary"].to_i
#      employee.position = row["position"]
#      employee.slack = row["slack"]
#      employee.github = row["github"]
#
#      employees << employee
#    end
#
#    return employees
#  end
#end
