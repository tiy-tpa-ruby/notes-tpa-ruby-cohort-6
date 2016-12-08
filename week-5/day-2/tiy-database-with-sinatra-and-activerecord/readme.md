# TIY Database

Your TIY Database with Postgres and Sinatra continues to climb the charts. You are bringing in thousands of new users a week! Time to upgrade the application again.

The Iron Yard now wants you to upgrade this to use the ActiveRecord gem and expand the application beyond Employees

## SETUP

### Step 1
Fork [this repository](https://github.com/tiy-tpa/tiy-database-with-sinatra-and-activerecord)

### Step 2

```sh
take ~/tiy/week-5/day-1
```

### Step 3

```sh
hub clone tiy-database-with-sinatra-and-activerecord
```

### Step 4

```sh
cd tiy-database-with-sinatra-and-activerecord
```

### Step 5

Run your app as you have in the prior assignments

```sh
ruby app.rb
```

## IMPORTANT

Read and complete _Explorer Mode_ first. For each mode read *all* of the requirements before starting your plan and work on the code.

## Explorer Mode
- Read the [ActiveRecord Guides](http://guides.rubyonrails.org/active_record_basics.html)
  - Only read these sections: 1, 2, 3, 4, 5. Then *STOP*
- Add the ability to track `courses` as well as employees
  - The information for a course should include (at a minimum):
    - `name`
    - `subject`
    - `start_date`
    - `end_date`
    - `intensive` (boolean, true if intensive class, false otherwise)
  - You'll need to create a table (follow the naming conventions!) using `pgcli`
  - Ensure there are the same CRUD _(create, read, update, delete)_ capabilities as we implemented for `employee` (including search, etc.)
  - Ensure there are navbar links for `courses`

## Adventure Mode
- Figure out how to specify an employee that teaches a course
- When displaying a course, show the name of the employee that is teaching

## Epic Mode
- On the employee show template, display all the courses that employee teaches
