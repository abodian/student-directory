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
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort, hobby: #{student[:hobby]})".center(40)
  end
end

def print_footer(students)
  if students.count >= 1
    puts "Overall, we have #{students.count} great students!"
  else
    exit
  end
end

students = input_students
print_header
print(students)
print_footer(students)
