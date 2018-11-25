#first we get the list of students
def input_students
  students = []
  #get the first name
  puts "Please enter name of the student"
  puts "Press enter twice to exit"
  name = gets.chomp
  puts "Please enter the cohort of the student"
  cohort = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohort, country_of_birth: :england}
    if students.count  > 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end
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
  puts "Overall, we have #{names.count} great students"
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print_students(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end


#call methods created above
interactive_menu

#input_students
#print_by_name(students, 'S')
#print_short_name(students)