# Reset database
puts "Clearing old data..."
Assignment.destroy_all
Student.destroy_all

# Sample data
STUDENT_NAMES = [
  "Alice Johnson",
  "Bob Martinez",
  "Charlie Kim",
  "Diana Patel",
  "Ethan Brown",
  "Fiona Smith"
]

SUBJECTS = [
  "Math Homework",
  "Science Lab",
  "English Essay",
  "History Reading",
  "Programming Project",
  "Art Portfolio"
]

STATUSES = ["pending", "submitted", "late"]

puts "Creating students and assignments..."

STUDENT_NAMES.each do |full_name|
  email = full_name.downcase.gsub(" ", ".") + "@example.com"
  student = Student.create!(name: full_name, email: email)

  rand(2..5).times do
    Assignment.create!(
      student: student,
      title: SUBJECTS.sample,
      description: "Auto-generated assignment for #{student.name}.",
      status: STATUSES.sample,
      due_date: Date.today + rand(1..21)
    )
  end
end

puts "Done!"
puts "Seeded #{Student.count} students and #{Assignment.count} assignments."
