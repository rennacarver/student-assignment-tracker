# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data (optional)
Assignment.destroy_all
Student.destroy_all

# Create students
students = Student.create!([
  { name: "Alice Johnson", email: "alice@example.com" },
  { name: "Bob Smith", email: "bob@example.com" },
  { name: "Charlie Lee", email: "charlie@example.com" }
])

# Create assignments for each student
students.each do |student|
  student.assignments.create!([
    { title: "Math Homework",     due_date: Date.today + 1, completed: false },
    { title: "Science Project",   due_date: Date.today + 3, completed: false },
    { title: "History Essay",     due_date: Date.today + 5, completed: true  }
  ])
end

puts "Seeded #{Student.count} students and #{Assignment.count} assignments."
