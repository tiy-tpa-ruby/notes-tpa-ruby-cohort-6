
# Enumerable

---

# But first

## Iteration

## AKA "Looping"

---

# I'm all about the 80's

![inline](https://media.giphy.com/media/zyx4xCaaQzlGo/giphy.gif)

---

```ruby
movies = ["The Karate Kid", "Weird Science", "Better Off Dead",
          "Real Science", "The Princess Bride", "Ferris Bueller's Day Off"]

# Print the name of the movie with the classic catch phrase '... two dollars ...'


i = 0
while i < movies.length do
  if movies[i] == "Better Off Dead"
    puts movies[i]
  end
  i = i + 1
end
```

---

![fit](https://s3.amazonaws.com/media-p.slid.es/uploads/329163/images/1396010/lpkyv.jpg)

---

# Lets talk about blocks

![inline](https://media.giphy.com/media/B6ZTenBvlzOFO/giphy.gif)

---

# Ruby Blocks
- "Small bits of code" (sometimes more than small)
- Might take input
- Might return output
- Similar to a method

- You have been using them already...

---

```ruby
5.times do
  puts "☃"
end
```

---

```ruby
[1,2,3,4,5].each do |index|
  puts index
end
```

---

# Using Blocks

---

```ruby
def bark
  yield
end

bark do
  puts "Woof!"
end
```

---

# Back to Iteration

---

# How might we implement this?

```ruby
[1,2,3,4,5].each do |index|
  puts index
end
```

---

# If you are curious how Ruby does it:
- MRI: https://github.com/ruby/ruby/blob/trunk/array.c#L1803
- Rubinius: https://github.com/rubinius/rubinius/blob/master/kernel/bootstrap/array.rb#L68

---

# Lets code it!

---

![original](https://s3.amazonaws.com/media-p.slid.es/uploads/329163/images/1396816/giphy.gif)

# Finding Elements

---

```ruby
movies = [
  "The Karate Kid",
  "Weird Science",
  "Better Off Dead",
  "Real Science",
  "The Princess Bride",
  "Ferris Bueller's Day Off"
]

# Find and print the name of the movie with the classic catch phrase '... two dollars ...'
```

---

# Live Coding!

---

```ruby
movies = [
  "The Karate Kid",
  "Weird Science",
  "Better Off Dead",
  "Real Science",
  "The Princess Bride",
  "Ferris Bueller's Day Off"
]

# Find and RETURN the name of the movie with the classic catch phrase '... two dollars ...'
```

- Return instead of print

---

# We've just implemented Ruby's #find method!

---

```ruby
movies = [
  "The Karate Kid",
  "Weird Science",
  "Better Off Dead",
  "Real Science",
  "The Princess Bride",
  "Ferris Bueller's Day Off"
]

favorite_movie = movies.find { |movie| movie == "Better Off Dead" }
```

---

![50%](https://s3.amazonaws.com/media-p.slid.es/uploads/329163/images/1396908/cornucopia.jpg)

# Enumerable's Cornucopia

```
find                                      include
max                                       select
reject                                    map
all?                                      any?
count                                     inject



                     and many more
```

---
