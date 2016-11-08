build-lists: true

# Terminal Basics
- `mkdir NAME` create a directory
- `cd NAME` change directory
- `take NAME` creates a directory *AND* changes to it

---

# More Terminal Basics

- `cd` without any directory name, puts you in your home directory
- `ls` list files
- `pwd` show current directory
- `touch NAME` creates a new file

---

# Terminal Tips

- Don't use spaces in directory or file names
- To bring back the previous commands you entered:
  - press the up-arrow key

---

# Git Basics

- `git` is our source control system
- It is where we will keep *all* of our work for the course
- It is likely the same source control system you will use in the field
- Even if your job uses a different system, they are all similar

---

# Git Basics

- Starts with a `repository`
- Initialize a repository: `git init` inside the directory you want to be a repository

---

# Adding our files

- Telling `git` to pay attention to a file
  - `git add FILENAME`
- Telling `git` to pay attention to all files in the current directory (and all sub-directories)
  - `git add .`

---

# Saving our work

- Making a `commit` (kind of like a save-point in a video game)
  - `git commit`
  - `git commit -m "Message"`
- Git keeps a history of all the changes we have made
- We can go back to any version at any time or at least look back to see what our work looked like in the past


---

# Git Messages
- We give `git` a message to indicate to future developers (or future versions of ourselves) *why* we did the work.

---

# Good Messages

- `Replaces h1 tag with a goonies logo`
- `Adds a nice color scheme to all paragraphs`
- `Adds images of all the goonies gang to their profiles`

---

# Not so good Messages
- `Stuff`
- `Work`
- `Done`
- `Fixes a bug`
- `(╯°□°）╯︵ ┻━┻`
- 🔥🔥🔥🔥🔥🔥🔥

---

# Github
- Remote storage for our repositories
- Sharing our work
- Acts as a form of `portfolio` of our work

---

# Creating a repository manually

- See `hello world` homework

---

# Automating from the command line

Lets make a new folder

- `cd`
- `cd tiy`
- `take scratch`
- `take effective-octo-parakeet`

---

# Initialize our new project
- `git init`
- `yo app-app alpha`
- `git add .`
- `git commit -m "The start of something wonderful"`

---

# Usinsg `hub` to create our repository

- `hub create effective-octo-parakeet`
- `git push --set-upstream origin master`
- `hub browse`

---

# Extra resources:
- [Mac Basics](https://www.apple.com/support/macbasics/)
- [Mouse versus Command Line](http://lifehacker.com/5633909/who-needs-a-mouse-learn-to-use-the-command-line-for-almost-anything)

