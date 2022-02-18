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
