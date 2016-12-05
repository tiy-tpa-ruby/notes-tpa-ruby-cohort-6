# TIY Database

Your TIY Database with CSV an Enumerable has been an amazing success.

The Iron Yard now wants you to upgrade this to use a full Postgres SQL database and place the application on the web so that everyone can use it.

Your task is to rewrite the features of the TIY Database using `pg` and `sinatra`

## IMPORTANT

Read and complete _Explorer Mode_ first. For each mode read *all* of the requirements before starting your plan and work on the code.

## Explorer Mode
- The landing page of the application should show a welcome message to the user explaining what the TIY Database is
- The top navigation menu should have an entry for `Employees`
- When you click the `Employees` nav item it should take you to an employee *index* URL which shows
  - List of all employee's in a table containing: name, phone, address, position, salary, slack, github
  - Each row in the table should have a link to show that user
- On the employee *index* URL there should be a link to take the user to a *new* employee URL
  - This page should show a form to fill in the details of an employee
  - When clicking the _submit_ button for this form, a new employee should be created
  - Redirect the user back to the *index* URL
- On the employee *index* URL there should be a _search_ form that allows you to type in some text and click a *search* button
  - When the form is submitted the page should now display any matching employees by name (partial) or slack (full match) or github (full match)
- When showing a player use a nice format for showing all of the user's information.
  - Maybe use a `list-group` or other bootstrap component to format the data

## Adventure Mode
- On the employee *show* URL, add a link to an *edit* URL that shows a form for this employee
  - The `edit` URL should show a form to change the details of the employee, the fields should be populated with the existing details
  - When the form is submitted it should take you back to the employee *show* URL
- On the employee *show* URL, add a link to a *delete* URL that will remove the employee and redirect the user to the employee *index* URL

## Epic Mode
- Create a similar system for managing `courses`
  - Ensure there is an *index*, *new*, *search*, and *delete* features
