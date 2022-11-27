# let's put all the students into an array
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
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  puts "Please enter their hobby"
  hobby = gets.chomp
 
  while !name.empty? do
    students << {name: name, cohort: :november, hobby: hobby}
    if students.count == 1
    puts "Now we have #{students.count} student"
    else
    puts "Now we have #{students.count} students"
    end
    name = gets.chomp
    if name != ""
      puts "Please enter their hobby"
      hobby = gets.chomp
    else
      break
    end
  end
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "------------------".center(30)
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort, hobby: #{student[:hobby]})"
  end
end

def print_footer(students)
  if students.count >= 1
    puts "Overall, we have #{students.count} great students!"
  else
    exit
  end
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
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu

