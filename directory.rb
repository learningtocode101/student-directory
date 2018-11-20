#first we print the list of students
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffery Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
  ]
# then print a header
def print_header
  puts "The students of Villians Academy"
  puts "------------"
end
# and then print them
def print_students(names)
  names.each do |name|
  puts "#{name[:name]} (#{name[:cohort]} cohort)"
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