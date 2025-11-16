# Student Assignment Tracker

<img width="825" height="825" alt="Screenshot 2025-11-15 at 11 55 25 PM" src="https://github.com/user-attachments/assets/2701e7d7-2157-4e13-80e4-1acb06abbeb7" />

## Motivation

Project Carver needs a platform where students can chat with their tutors, see their assignments, see upcoming classes, pay for completed lesssons, and more. This is a first attempt to begin building that platform. Ruby on Rails was used to compare with a JS/Express/Node stack.

## Features

- Add, edit, and delete students from the student list
- Add, edit, delete, and mark completed on assignments

## Future enhancements
- User accounts and authentication for students and tutors
- Scheduling, payment, assignment picture upload, and chat features
- Dark mode toggle
- Style overhaul to match Project Carver theme

## Lessons Learned
- Keep instructions scoped to one step at a time for AI to have better context
- sometimes AI performs better with context and sometimes better without
- GPT-5 mini within coPilot tends to struggle compared to the full webapp on finding bugs (less context is better)
- AI is not great with finding good CSS styles or finding styling bugs
- Silly human errors like running the server but not the asset watcher won't be caught by AI
- Create a problem and AI usually has much better chance of figuring out the original issue. Ex. Tailwind was collapsing a div with a button inside. Adding a border fixed the issue and revealed something subtle about the way tailwind handles rendering.
- AI is available within the dev console of chrome for further debugging

## Challenges
- By integrating the assignments into the students show page, it caused quite a few conflicts with nested routes
     - student_assignments_path(@student)
     - student_assignment_path(@student, @assignment)
     - edit_student_assignment_path(@student, @assignment)
- 'before_action' side effects
     - before_action :set_student needed to be set before :set_assignment
     - the set_student had to account for two cases (new vs. existing)
- form builders (form_with) need the correct model
     - form_with model: assignment
     - form_with model: @student, @assignment
- redirect paths after CRUD actions had to be rebuilt after scaffolding because of nested routes
