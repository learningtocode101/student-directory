#first we print the list of students
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffery Baratheon",
  "Norman Bates",
  ]
# then print a header
def print_header
  puts "The students of Villians Academy"
  puts "------------"
end
# and then print them
def print_students(names)
  names.each do |name|
  puts name
  end
end

# finally, we print the total number of students
def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

#call methods created above
print_header
print_students(students)
print_footer(students)