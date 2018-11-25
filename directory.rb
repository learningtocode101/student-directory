require 'csv'
@students = []

def input_students
  puts "Please enter name of the student"
  puts "Press enter twice to exit"
  name = STDIN.gets.chomp
  puts "Please enter the cohort of the student"
  cohort = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: cohort, country_of_birth: :England}
    if @students.count  > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    puts "Please enter the names of the student"
    name = STDIN.gets.chomp
    puts "Please enter the cohort of the student"
    cohort = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villians Academy".center(50)
  puts "--------------------".center(50)
end

def print_students_list()
  index = 1
  until index > @students.size do
    current = @students[index - 1]
    puts "#{index}. #{current[:name]}, #{current[:country_of_birth]} (#{current[:cohort]} cohort)".center(50) 
    index += 1
  end
end

def print_footer()
  if @students.count == 1
  puts "Overall, we have #{@students.count} great student".center(50)
  else
  puts "Overall, we have #{@students.count} great students".center(50)
  end
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
  puts "3. Save student list"
  puts "4. Load Student list"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list()
  print_footer()
end

def save_students()
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:country_of_birth], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "Saving students.csv"
  file.close
end

def ask_for_file
  puts "Enter file name with extension (.csv)"
  gets.chomp
end

def add_students
  @students << {name: @name, country_of_birth: "England", cohort: @cohort}
end

def load_students(filename = ask_for_file)
  CSV.foreach(filename) do |line|
    @name, @cohort, @country_of_birth = line[0], line[1], line[2]
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
interactive_menu

