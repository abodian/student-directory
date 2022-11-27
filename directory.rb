# let's put all the students into an array
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp
  puts "Please enter their hobby"
  hobby = STDIN.gets.chomp
 
  while !name.empty? do
    @students << {name: name, cohort: :november, hobby: hobby}
    if @students.count == 1
    puts "Now we have #{@students.count} student"
    else
    puts "Now we have #{@students.count} students"
    end
    name = STDIN.gets.chomp
    if name != ""
      puts "Please enter their hobby"
      hobby = STDIN.gets.chomp
    else
      break
    end
  end
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
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobby = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil? # get out of hte method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

interactive_menu

