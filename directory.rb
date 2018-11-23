#first we get the list of students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create and empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end
# then print a header
def print_header
  puts "The students of Villians Academy"
  puts "------------"
end
# and then print them
def print_students(names)
  names.each_with_index do |name, index|
  puts "#{index + 1} #{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_by_name(names, letter)
  names.each do |student|
    if student[:name].chr.upcase == letter.upcase
      puts "#{student[:name]}"
    end
  end
end

# finally, we print the total number of students
def print_footer(names)
  print "Overall, we have #{names.count} great students"
end

students = input_students
#call methods created above
print_header
print_students(students)
print_footer(students)
input_students
print_by_name(students, 'S')