class Person
  attr_accessor :name, :phone_number, :address, :position, :salary, :slack_account, :github_account
end

class Database
  def initialize
    @people = []
  end

  def add_person
    puts "What is the name of the person you wish to add?"
    search_name = gets.chomp

    matching_people = @people.select { |person| person.name == search_name }
    if matching_people.any?
      puts "We already have a #{search_name} in our database"
    else
      person = Person.new

      person.name = search_name

      puts "What is the person's address?"
      person.address = gets.chomp

      puts "What is the person's salary?"
      person.salary = gets.chomp

      puts "What is the person's phone number?"
      person.phone_number = gets.chomp

      puts "What is the person's position?"
      person.position = gets.chomp

      puts "What is the person's slack account?"
      person.slack_account = gets.chomp

      puts "What is the person's github account?"
      person.github_account = gets.chomp

      @people << person
    end
  end

  def search_person
    puts "What are you looking for (I'll search the name, github, and slack accounts)"
    search_text = gets.chomp

    matching_people = @people.select { |person| person.name.include?(search_text) || person.slack_account == search_text || person.github_account == search_text }
    if matching_people.empty?
      puts "Didn't find anyone"
    else
      matching_people.each do |person|
        puts "Name:      #{person.name}"
        puts "Salary:    #{person.salary}"
      end
    end
  end

  def delete_person
    puts "What name are you looking to delete?"
    search_name = gets.chomp

    inital_count = @people.length
    @people.delete_if { |person| person.name == search_name }

    if @people.length != inital_count
      puts "I deleted #{search_name} from the database"
    else
      puts "Sorry, that person isn't there"
    end
  end

  def show_menu
    loop do
      puts "What do you want to do?"
      puts
      puts "(A)dd a person"
      puts "(S)earch for a person"
      puts "(D)elete a person"
      puts
      puts "Action: "
      answer = gets.chomp

      case answer
      when "A"
        add_person
      when "S"
        search_person
      when "D"
        delete_person
      else
        puts "Unknown option"
      end
    end
  end
end

my_database = Database.new
my_database.show_menu
