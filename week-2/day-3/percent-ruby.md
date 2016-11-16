# Percent Strings

- You can use `%(.....)` to create a string.
- This is helpful for cases where you might have double or single quotes in your string
- example: `%(How can "Ruby" be so powerful a 'language')`

## Besides %(...) which creates a String, The % may create other types of object. As with strings, an uppercase letter allows interpolation and escaped characters while a lowercase letter disables them.

- These are the types of percent strings in ruby:

| %    | Description            | Example             | Output  |
|------|------------------------|---------------------|---------|
| `%i` | Array of Symbols       | `%i{one two three}` | `[:one, :two, :three]`
| `%q` | String                 | `%q{one two three}` | `"one two three"`
| `%r` | Regular Expression     | `%r{one.*two.*}`    | `/one.*two.*/`
| `%s` | Symbol                 | `%s{one}`           | `:one`
| `%w` | Array of Strings       | `%w{one two three}` | `["one", "two", "three"]`
| `%x` | Caputre command result | `%x{ls}`            | `app.rb\nfile.txt\n`

- For the two array forms of percent string, if you wish to include a space in one of the array entries you must escape it with a "\" character:
- ex `%w[one one-hundred\ one]`
- results: `["one", "one-hundred one"]`
- If you are using "(", "[", "{", "<" you must close it with ")", "]", "}", ">" respectively. You may use most other non-alphanumeric characters for percent string delimiters such as "%", "|", "^", etc.
