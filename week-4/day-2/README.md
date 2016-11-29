# What's wrong with CSV?
- Look back at employees.csv
- Only clue to the structure of the data is our CSV header row
- Convention of only the first row of CSV defines the names of the columns
- Nothing that defines the type of data (strings, dates, versus numbers, etc.)
- How would I relate data between sets? (e.g. associate instructors versus the classes they teach)

- This is where databases come in
- Perhaps you have used Microsoft Access or similar

# Postgres
- Very popular open source database
- Installed on day-1 setup
- REPL: `psql`
- Better REPL: `pgcli`


# SQL
- Databases come with their own language
- SQL (Structured Query Language)
- Mostly going to be using SQL for:
  - Creating tables
  - Creating rows in tables
  - Reading things (rows) from tables
  - Updating thigns in tables
  - Deleting things from tables
  - Searching for things in tables
  - MADE for exactly this kind of CRUD application
- Fairly english like syntax

# Our SQL conventions
- New convention!
  - Table names will be plural
  - The table that holds each person will be called 'people'

# Create our first database
- `createdb sample_database`
- `pgcli sample_database`

# Working with our first table

## Creating a table
- One table named `people` with two columns, `name` and `salary`
```sql
create table people(name varchar(255), salary integer);
```

## Selecting information from our table
- Ask pgcli to show us all the `people` in our database
```sql
select name, salary from people;
```

## Inserting information into our table
- Lets put some people in our database
```sql
insert into people values ('Toni', 1000000);
```
- Values in the same order as the columns we declared
- Run the select again and we will see one row of data
```sql
insert into people values ('Jason', 2000000);
```
- Select again, now we have two rows

## More about selecting information
- Get all the columns from a table
```sql
select * from people;
```
- Select specific columns
```sql
select name from people;
select salary from people;
```

## Selecting with conditions
- All people with the name Toni
```sql
select name, salary from people where name = 'Toni';
```
  - We just get back one row
- All people with the name Gavin
```sql
select name, salary from people where name = 'Gavin';
```
  - We get back no rows from this query
- What if I just want to know Toni's salary?
```sql
select salary from people where name = 'Toni';
```

## How is SQL like Ruby?
```sql
select * from people where name = "Toni"
```
is like
```ruby
@people.select { |person| person.name == "Toni" }
```

## Creating multiple tables and relating them
- Create a couple of tables
```ruby
create table players(name varchar(255), address varchar(255), shirt_size varchar(4), age integer);
```

## Insert a few players into the table
- Place three players in the `players` table
```sql
insert into players values('Gavin', '123 Main Street', 'M', 46);
insert into players values('Marty', '555 Elm Street', 'M', 23);
insert into players values('Jason', '12345 Palm Court', 'M', 41);
```

## Selecting
- Select all the players
```sql
select * from players
```
- Select some data from the table
```sql
select name, shirt_size from players
```
- Select the name and shirt size for all players older than 30
```sql
select name, shirt_size from players where age > 30
```
- equal to 30, less than 30, etc.

## Partial comparisons
- All players that have a `v` in their name
```sql
select name, shirt_size from players where name like '%v%'
```
- All players who's name ENDS in `n` => Gavin and Jason
```sql
select name, shirt_size from players where name like '%n'
```
- All players who's name STARTS with `G`
```sql
select name, shirt_size from players where name like 'G%'
```

## Controlling output
- Names of all players sorted by name (increasing)
```sql
select name from players order by age;
```
- What if there were millions of rows? Lets get back the youngest player (the first one in the output)
```sql
select name from players order by age limit 1
```
  - This is how pagination is done
  - `limit` is often paired with `offset`
  - Can ask for a certain number of rows starting at a particular offset in the results

## Altering rows
- Going to change Gavin's shirt size
- We don't have to remove the row and add it back in
- We can update the row in place
```sql
update players set shirt_size = 'L' where name = 'Gavin'
```
- Can change multiple items at a time
```sql
update players set shirt_size = 'L', address = '500 King Street' where name = 'Gavin';
```
- Be careful with the `update` statement
  - What happens if we leave off the `where` clause?
```sql
update players set shirt_size = "M";
```
  - ALL the shirt sizes are now medium
  - What happens if you set the `balance=0` on your accounts table but forget the `where` clause!? Ooops

## Math
- We can also do math related things in SQL
```sql
select max(age) from players;
select max(age) from players where age < 45;
select min(age) from players;
select avg(age) from players;
```
- Can be done on strings and dates too

## Deleting data
- Kicking marty off the team, time to delete his record
```sql
delete from players where name = "Marty";
```
- Again, be careful with our where clause as this would remove everything:
```sql
delete from players
```
- Can also negate comparisons, remove all the players that aren't Jason
```sql
delete from players where name != "Jason";
```

## Multiple Tables
- What if all these players are on different teams
  - Could put the name of the team as a column on players
  - But what if the person plays multiple sports?
  - Could have `team1` and `team2`, but what if I am on three teams?
- Lets create a separate table for teams
```sql
create table teams(name varchar(255), mascot varchar(255), sport varchar(255));
```
- insert some data
```sql
insert into teams values('TIY Football', 'Franky Football', 'Football');
insert into teams values('TIY Soccer', 'Scooter', 'Soccer');
insert into teams values('TIY Baseball', 'Bruiser', 'Baseball');
```

## Joining tables together
- Create a table to associate `players` and `teams`
```sql
create table memberships(player_name varchar(255), team_name varchar(255));
```
  - uses unique columns since I can't call them both `name`
- Lets put some information in here
```sql
insert into memberships values('Gavin', 'TIY Football');
insert into memberships values('Jason', 'TIY Football');
insert into memberships values('Marty', 'TIY Baseball');
```
- What if I wanted to know the mascots associated with each player?
  - Can select from multiple tables too!
```sql
select name from players, teams, memberships
```
  - But I can also relate them together
  - How these three tables related?
  - Lets start from players and memberships
  - `players` `names` should match the `memberships` `player_name`
  - So we can add a where clause:
    - `where players.name = memberships.player_name`
  - But there is more to do in order to link the last table
  - So we must add an `AND` clause to our `where` clause
    - `AND teams.team_name == memberships.team_name`
  - This is known as a join
    - We are `join`ing tables together in order to relate data
  - We actually want to pull out the `players.name` and the `teams.mascot`
  - Here is the correct query
```sql
select teams.mascot from teams, players, memberships where teams.name = memberships.team_name and memberships.player_name = players.name;
```
  - This gives us a way to go from the `players` table to the `memberships` table and from the `memberships` table to the `teams` table
  - What happens if a player (`Gavin`) also plays on another team?
```sql
insert into memberships values("Gavin", "TIY Baseball");
```
  - Now he appears *twice* in the output
  - Each of the *single* player names pulls back *two* rows from `memberships` which then each match a single row in `teams`

# Why are names bad join clauses
- We have a problem
- Lets say `Gavin` changes his name to `Rubyist`
```sql
update players set name = 'Rubyist' where name = 'Gavin';
```
- Now lets run the report
  - This `player` isn't in the report any more
- Why is this player missing from the report?
  - As we try to relate from the `players` table to the `memberships` table there is nothing to match
  - `name` doesn't *seem* like it is volatile, but it is
  - Data from the *real world* can be too variable to use as relational columns

# Fixing the join problem
- Recreate the tables but instead of *starting* with name as the first column, start with a field called `id` as an integer)
- Follow along with all the other fields
```sql
create table players(id serial, name varchar(255), address varchar(255), shirt_size varchar(4), age integer);
create table teams(id serial, name varchar(255), mascot varchar(255), sport varchar(255));
```
- Now lets create some players
```sql
insert into players(name, address, shirt_size, age) values('Gavin', '123 Main Street', 'XL', 45);
insert into players(name, address, shirt_size, age) values('Jason', '456 Elm Street', 'XL', 40);
insert into players(name, address, shirt_size, age) values('Marty', '79 Ferm Street', 'M', 30);
```
- Now lets create teams
```sql
insert into teams(name, mascot, sport) values('TIY Football', 'Sammy the Shark', 'Football');
insert into teams(name, mascot, sport) values('TIY Baseball', 'Barky the Dog', 'Baseball');
```
  - These `id`s start over for the `teams` table
- Every player (and team) has a unique identifier
  - Just like our TIY access cards have an id on the back, the badge number
  - When we scan these into the door, the system knows which *id* was scanned, relating that to the person
- Now we need to create the `memberships` table to relate the two
```sql
create table memberships(id serial, team_id integer, player_id integer);
```
  - This table also gets an `id`, but instead of using the `team name` or the `player name` we use their `id`s
- Now lets put some players on some teams (insert memberships)
- Lets put Gavin on the baseball team
```sql
insert into memberships(team_id, player_id) values(2, 1);
```
    - The `team` `id` for baseball is `2`
    - And the `player` `id` for Gavin is `1`
- Lets put Marty on the baseball team as well
```sql
insert into memberships(team_id, player_id) values(2, 3);
```
- Finally put Jason as the sole member of the football team
```sql
insert into memberships(team_id, player_id) values(1, 2);
```
- Review what is in each table
  - Notice now that our `memberships` table just has a bunch of numbers in it.
  - Time to join
```sql
select players.name, teams.mascot from players, teams, memberships where players.id = memberships.player_id and teams.id = memberships.team_id;
```

# Lets see what happens when a player changes their name
- Lets change Gavin's name
  ```sql
  update players set name = 'Rubyist' where name = 'Gavin';
  ```
- Rerun our query
  - See that `Rubyist` appears on the report still. Unlike last time where the row was missing
  - This is because while the name changed, the `id` always stays consistent for the same person
  - This is how all tables going forward are going to be created and used.
  - The `id` is going to be our `id`entifier for the row
  - This is a `convention` used by nearly all `Rails` applications

# IDs don't get reused
- If we delete a player with the highest ID and recreate it
  - The existing ID won't be reused, the ID will continue to increase
- Delete a player from the players table
```sql
delete from players where id = 2
```
  - Except our memberships table still has a row with `player_id` = `2`
  - Also should remove the memberships
  - Some database support cascading deletes

# Using our database from Ruby
- Lets put some databases into our ruby!
- There is a `pg` library
- `gem install pg`
- From `irb`
  ```ruby
  require 'pg'
  database = PG.connect(dbname: 'databasics')
  ```
- This variable `database` is our connection to that database and all of its tables
- We can ask it for rows
  - `rows = database.exec("select * from players")`
- `rows` is a `PG::Result` which we can iterate over
  ```ruby
  rows.each do |row|
    p row
  end
  ```

# Making a sample Ruby app to print out some data

- `tiysports.rb`

  ```ruby
  require 'pg'

  database = PG.connect(dbname: 'databasics')
  rows = database.exec("select * from players")
  rows.each do |row|
    puts "There is a player named #{row["name"]} that lives at #{row["address"]} who is #{row["age"]} and wears a size #{row["shirt_size"]}"
  end
  ```

- And we see some output, any of the players in our database
- Lets move our `report` into ruby
  - Place the multi-line query in as the string to `execute`
  - Iterate the resulting rows the same way

  ```ruby
  require 'pg'

  database = PG.connect(dbname: 'databasics')
  rows = database.exec("select players.name, teams.mascot from players, teams, memberships where players.id = memberships.player_id and teams.id = memberships.team_id;")
  rows.each do |row|
    puts "The player named #{row["name"]} hangs out with #{row["mascot"]}"
  end
  ```
