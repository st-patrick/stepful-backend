# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Student.create(name: "Darth Maul")
Student.create(name: "Anakin Skywalker")

Coach.create(name: "Darth Sidious")
Coach.create(name: "Obi-Wan Kenobi")

Slot.create(start_time: "2013-02-02 01:00:00 UTC", coach_id: 1, student_id: 1)
Slot.create(start_time: "2024-03-02 01:00:00 UTC", coach_id: 1)

Slot.create(start_time: "2024-03-03 01:00:00 UTC", coach_id: 2)
Slot.create(start_time: "2024-03-02 01:00:00 UTC", coach_id: 2, student_id: 2)

Review.create(slot_id: 1, score: 4, notes: "student was impatient, aggressive and generally evil. Perfect.")