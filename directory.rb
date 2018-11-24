#first we get the list of students
def input_students
  students = []
  #get the first name
  puts "Please enter name of the student"
  name = gets.chomp
  puts "Please enter the cohort of the student"
  cohort = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort, country_of_birth: :england}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "Please enter the names of the student"
    name = gets.chomp
    puts "Please enter the cohort of the student"
    cohort = gets.chomp
  end
  #return the array of students
  students
end
# then print a header
def print_header
  puts "The students of Villians Academy".center(100)
  puts "------------".center(100)
end
# and then print them
def print_students(names)
  index = 1
  until index > names.size do
    current = names[index - 1]
    puts "#{index}. #{current[:name]} from #{current[:country_of_birth]} (#{current[:cohort]} cohort)".center(100) 
    index += 1
  end
end

def print_by_name(names, letter)
  names.each do |student|
    if student[:name].chr.upcase == letter.upcase
      puts "#{student[:name]}"
    end
  end
end

def print_short_name(names)
  puts "Names with 12 characters or less:"
  names.each do |student|
    puts student[:name] if student[:name].length < 12
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
print_short_name(students)