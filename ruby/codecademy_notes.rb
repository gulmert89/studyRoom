=begin
These notes are taken from the Ruby tutorial in Codecademy.
The projects cover pretty much everything but probably not everything.
So, be careful when a recap is needed!
=end

### 1st Lesson Notes: Introduction ###
# First Project: Putting the form in Formatter
print "What's your first name? "
first_name = gets.chomp
first_name.capitalize!

print "...and your last name? "
last_name = gets.chomp
last_name.capitalize!

print "Your city? "
city = gets.chomp
city.downcase!  # It's here for example.

print "State? "
state = gets.chomp
state.upcase!

print "#{first_name} #{last_name} is from #{city.capitalize!}, #{state}."


### 2nd Lesson Notes: Control Flow ###
test_1 = (true || false) || (false && true)  # should be true
test_2 = (true && (3 < 4)) && (false || (0 == 0))  # should be true
test_3 = (false || false) || !(true || false)  # should be false

is_liar = false
print "Truth has been spoken!" unless is_liar
# Outputs: "Truth has been spoken!"

# Second Project: Duffy Duckifier
puts 3.times {puts "Welcome!"}

print "Provide an input: "

user_input = gets.chomp
user_input.downcase!

if user_input.include? "s"
  user_input.gsub!(/s/, "th")
  puts user_input
elsif user_input.length == 0
  puts "Please enter a string."
else
  puts "There is no 's' character(s) in the input string."
end


### 3nd Lesson Notes: Looping ###
counter = 1
until counter > 10
  puts counter
  counter += 1
end

for num in 1...21
    puts num
  end

i = 20
loop {  # loop do ... end
  i -= 1
  next if i % 2 == 1
  print "#{i}"
  break if i <= 0
}0

# Third Project: Redacted!
puts "Sentence: "
text = gets.chomp.downcase
puts "Redacted word: "
redact = gets.chomp.downcase
words = text.split(" ")

words.each do |w|
  if w == redact
    print "REDACTED "
  else
    print w + " "
  end
end


### 4th Lesson Notes: Arrays & Hashes ###
friends = ["Milhouse", "Ralph", "Nelson", "Otto"]
family = {
    "Homer" => "dad",
    "Marge" => "mom",
    "Lisa" => "sister",
    "Maggie" => "sister"
}
friends.each { |x| puts "Friend #{x}" }
family.each { |x, y| puts "#{x}: #{y}" }

s = [  # 2D array
    ["ham", "swiss"],
    ["turkey", "cheddar"],
    ["roast beef", "gruyere"]
]
s.each do |sub_array|
  sub_array.each { |item|
    print item, " "
  }
end

sounds = Hash.new
sounds["dog"] = "woof"
sounds["cat"] = "meow"

secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => "Dexter Douglas"
}
secret_identities.each do |hero_alias, real_id|
  puts "#{hero_alias}: #{real_id}"
end

# Fourth Project: Create a Histogram
puts "Text: "
text = gets.chomp
words = text.split(" ")
frequencies = Hash.new(0)
# Py: freq = dict().fromkeys(words, 0)

words.each { |w|
  frequencies[w] += 1
}

frequencies = frequencies.sort_by { |w, c| c}
frequencies.reverse!
# Py: freq = dict(sorted(freq.items(), key=lambda x: x[1], reverse=True))

frequencies.each do |w, c|
  puts w + " " + c.to_s  # or String(c)
end


### 5th Lesson Notes: Blocks & Sorting ###
def array_of_10
  puts (1..10).to_a  # To array
end
array_of_10

def what_up(greeting, *friends)  # "splat arguments"
  friends.each { |friend| puts "#{greeting}, #{friend}!" }
end
what_up("What up", "Ian", "Zoe", "Zenas", "Eleanor")

book_1 = "A Wrinkle in Time"
book_2 = "A Brief History of Time"
print book_1 <=> book_2  # Output: 1. 
# This is called "Combined Comparison Operator". Outputs -1, 0, or 1.

books = [
  "Charlie and the Chocolate Factory",
  "War and Peace",
  "Utopia",
  "A Brief History of Time",
  "A Wrinkle in Time"
]
# To sort our books in ascending order, in-place
puts "Ascending order:"
books.sort! { |firstBook, secondBook| firstBook <=> secondBook }  # Loop block is unnecessary.
puts books
# Sort your books in descending order, in-place below
puts "\nDescending order:"
books.sort! do |firstBook, secondBook| secondBook <=> firstBook end
print books

# Fifth Project: Ordering Your Library
def sorter(arr, rev=false)
  unless rev
    return arr.sort!
  else
    return arr.sort.reverse!
  end
end

numbers = [3,7,2,5]
puts sorter(numbers, true)


## 6th Lesson: Hashes & Symbols
puts "string".object_id  # 16346560
puts "string".object_id  # 16346360
puts "string".class      # String
puts :symbol.object_id   # 802268
puts :symbol.object_id   # 802268
puts :symbol.class       # Symbol
# Why symbols?
# They’re immutable, meaning they can’t be changed once they’re created,
# Only one copy of any symbol exists at a given time, so they save memory,
# Symbol-as-keys are faster than strings-as-keys because of the above two reasons.

:some_symbol.to_s  # ==> "some_symbol"
"some_string".to_sym  # ==> :some_string
"some_string".intern  # ==> :some_string

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
symbols = []
strings.each do |s|
  symbols.push(s.to_sym)
end
puts symbols  # [:HTML, :CSS, :JavaScript, :Python, :Ruby]

movies = {
  the_matrix: "Made in 1999"  # the key is still a symbol
}
puts movies  # {:the_matrix=>"Made in 1999"}

# Performance of String and Symbol
require 'benchmark'
string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]
string_time = Benchmark.realtime do
  100_000_000.times { string_AZ["r"] }
end
symbol_time = Benchmark.realtime do
  100_000_000.times { symbol_AZ[:r] }
end
puts "String time: #{string_time} seconds."  # String time: 7.074 seconds.
puts "Symbol time: #{symbol_time} seconds."  # Symbol time: 4.989 seconds.

movie_ratings = {
  memento: 3,
  the_matrix: 5,
  truman_show: 4,
}
good_movies = movie_ratings.select { |k, v| v > 3}
puts good_movies  # {:the_matrix=>5, :truman_show=>4}

good_movies.each_key do |k| puts k end
good_movies.each_value do |v| puts v end

# Sixth Project: A Night At The Movies
movies = {fight_club: 5}
puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp
case choice
  when "add"
    puts "Movie name:"
    title = gets.chomp.to_sym
    if movies[title].nil?
      puts "Rating value:"
      rating = gets.chomp.to_i
      movies[title] = rating
      puts "The movie '#{title}' is added."
    else
      puts "The movie has already added to the database."
    end
  when "update"
    puts "Please provide the movie name to be updated:"
    title = gets.chomp.to_sym
    if movies[title].nil?
      puts "The movie is not in the database. Please add it first."
    else
      puts "New rating value:"
      updated_rating = gets.chomp.to_i
      movies[title] = updated_rating
      puts "The rating of the movie has been updated."
      puts movies
    end
  when "display"
    movies.each { |m, r| puts "#{m}: #{r}"}
  when "delete"
    puts "Which movie you would like to delete:"
    title = gets.chomp.to_sym
    if movies[title].nil?
      puts "No such movie exist in the database. Try again."
    else
      movies.delete(title)
      puts "The movie has been deleted from the database."
    end
  else
    puts "Error!"
end


## 7th Lesson: Refactoring
puts 3 < 4 ? "The condition is true." : "The condition is false."

puts "Hello there!"
greeting = gets.chomp
case greeting
  when "English" then puts "Hello!"
  when "French" then puts "Bonjour!"
  when "German" then puts "Guten Tag!"
  when "Finnish" then puts "Haloo!"
  else puts "I don't know that language!"
end
# Conditional Assignment:
favorite_book = nil
puts favorite_book
favorite_book ||= "Cat's Cradle"
puts favorite_book
favorite_book ||= "Why's (Poignant) Guide to Ruby"
puts favorite_book
favorite_book = "Why's (Poignant) Guide to Ruby"
puts favorite_book
# Outputs:
#  (nothing)
# Cat's Cradle
# Cat's Cradle
# Why's (Poignant) Guide to Ruby

# Implicit Return
def multiple_of_three(n)
  n % 3 == 0 ? "Yep!" : "Nope!"  # "return" is deleted!
end
puts multiple_of_three(5)  # Ruby’s methods will return the result of the last evaluated expression.

# Short-circuit evaluation
def a
  puts "A was evaluated!"
  return true
end
def b
  puts "B was also evaluated!"
  return true
end
puts a || b
puts "------"
puts a && b
# Outputs: (This also holds for 'false && ...')
# A was evaluated!
# true
# ------
# A was evaluated!
# B was also evaluated!
# true

"L".upto("P") {|l| print l + " "}  # L M N O P
print "\n"
10.downto(3) {|n| print n, " "}  # 10 9 8 7 6 5 4 3 

[1, 2, 3].respond_to?(:push)  # true
[1, 2, 3].respond_to?(:to_sym)  # false
age = 26
puts age.respond_to?(:next)  # true
puts age.next  # 27

# concatenation operator
alphabet = ["a", "b", "c"]
alphabet << "d"  # alphabet.push("d")

caption = "A giraffe surrounded by "
caption << "weezards!"  # caption += "weezards!"

# Seventh Project: The Refactor Factory
require 'prime'
def first_n_primes(n)  # "return"s and condition blocks are simplified
    "n must be an integer." unless n.is_a? Integer
    "n must be greater than 0." if n <= 0
    Prime.first n
end
puts first_n_primes(10)


## 8th Lesson: Blocks, Procs, And Lambdas
fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
doubled_fibs = fibs.collect {|i| i*2}  # .collect! for inplace
puts doubled_fibs  # [2, 2, 4, 6, 10, 16, 26, 42, 68, 110]
# yield:
def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end
block_test { puts ">>> We're in the block!" }
# Outputs:
# We're in the method!
# Yielding to the block...
# >>> We're in the block!
# We're back in the method!
