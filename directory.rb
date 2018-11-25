require 'csv'
#first we get the list of students
@students = []
def input_students
  
  #get the first name
  puts "Please enter name of the student"
  puts "Press enter twice to exit"
  @name = STDIN.gets.chomp
  puts "Please enter the cohort of the student"
  @cohort = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: cohort, country_of_birth: :England}
    if @students.count  > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    #get another name from the user
    puts "Please enter the names of the student"
    @name = STDIN.gets.chomp
    puts "Please enter the cohort of the student"
    @cohort = STDIN.gets.chomp
  end
  
end
# then print a header
def print_header
  puts "The students of Villians Academy".center(50)
  puts "------------".center(50)
end
# and then print them
def print_students_list()
  index = 1
  until index > @students.size do
    current = @students[index - 1]
    puts "#{index}. #{current[:name]}, #{current[:country_of_birth]} (#{current[:cohort]} cohort)".center(50) 
    index += 1
  end
end

# finally, we print the total number of students
def print_footer()
  puts "Overall, we have #{@students.count} great students"
end

def interactive_menu
  loop do
    print_menu()
    selection(STDIN.gets.chomp)
  end
end

def selection(option)
  case option
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students()
        puts "File saved"
      when "4"
        load_students()
        try_load_students
      when "9"
        puts "Exiting..."
        exit
      else
        puts "I don't know what you meant, try again"
  end
end

def print_menu()
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list()
  print_footer()
end

def save_students()
  #index = 1
  file = File.open("students.csv", "w")
  @students.each do |student|
    #current = @students[index - 1]
    student_data = [student[:name], student[:country_of_birth], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Input saved to students.csv"
  file.close
end

def ask_for_file
  puts "Enter file name with"
  gets.chomp
end

def add_students
  @students << {name: @name, cohort: @cohort.to_sym}
end

def load_students(filename = ask_for_file)
  CSV.foreach(filename) do |line|
    @name, @cohort = line[0], line[1]
      add_students
  end 
  puts "#{filename} loaded"
end

def try_load_students
  filename = ARGV.first 
  return if filename.nil?
  if File.exists?(filename) 
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end
	

#call method 
try_load_students
interactive_menu

