# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

- Getting Started with Rails:

1. Create the Project
   rails new assignment_tracker
2. Create the database
   bin/rails db:create
3. Start the server
   bin/rails server
4. Generate the database models
   bin/rails g model Student name:string email:string
   bin/rails g model Assignment title:string due_date:date completed:boolean student:references
5. Migrate the database
   bin/rails db:migrate
6. Add controllers and routes
   bin/rails g controller Students index show
   bin/rails g controller Assignments index show
   In config/routes.rb
   resources :students do
   resources :assignments
   end
   Defines the root path route ("/")
   root "assignments#index"
7. Update Models
   Student
   has_many :assignments, dependent: :destroy
   Assignments
   belongs_to :student
8. Add seeds
   bin/rails db:seed
   or RESET
   bin/rails db:reset
9. Start asset watcher
   bin/dev
10. Add hot reload (webpage refreshes on file saves)
    In Gemfile
    group :development do
    gem "rails_live_reload"
    end

Rails Console Command:
rails console

Things Learned:
Keep instructions scoped to one step at a time for AI to have better context.
AI is not great with styling.
Create a problem and AI usually has much better chance of figuring out the original issue. Ex. Tailwind was collapsing a div with a button inside. Adding a border fixed the issue and revealed something subtle about the way tailwind handles rendering.
