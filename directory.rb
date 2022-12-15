# let's put all the students into an array
@students = []

def welcome_message
  puts "Please enter the name of a student"
  puts "To finish, just hit return twice"
end

def single_student_record
  while !@name.empty? do
    push_students_to_array
    if @students.count == 1
    puts "Now we have #{@students.count} student"
    else
    puts "Now we have #{@students.count} students"
    end
    puts "Please enter the name of the next student, or hit return twice"
    @name = STDIN.gets.chomp
    if @name != ""
      puts "Please enter their cohort"
      @cohort = STDIN.gets.chomp
      puts "Please enter their hobby"
      @hobby = STDIN.gets.chomp
    else
      break
    end
  end
end

def input_students
  welcome_message
  @name = STDIN.gets.chomp
  puts "Please enter their cohort"
  @cohort = STDIN.gets.chomp
  puts "Please enter their hobby"
  @hobby = STDIN.gets.chomp
  single_student_record
end

def print_header
  puts "The students of Villians Academy"
  puts "------------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort, hobby: #{student[:hobby]})"
  end
end

def print_footer
  if @students.count >= 1
    puts "Overall, we have #{@students.count} great students!"
  else
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file of your choice"
  puts "4. Load the list from a file of your choice"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  puts "Please type the name of the file to save to: "
  user_file = STDIN.gets.chomp
  file = File::open(user_file, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:hobby]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "\nStudents successfully saved"
end

def load_students(filename = "students.csv")
  puts "Please type the name of the file to load from: "
  filename = STDIN.gets.chomp
  file = File::open(filename, "r") do |file|
    file.readlines.each do |line|
    @name, @cohort, @hobby = line.chomp.split(',')
      push_students_to_array
    end
  end
  puts "\nStudents successfully loaded"
end

def try_load_students
  filename = ARGV.first
  File.open(students.csv) if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def push_students_to_array
  @students << {name: @name, cohort: @cohort, hobby: @hobby}
end


interactive_menu

