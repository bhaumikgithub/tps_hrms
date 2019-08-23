# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


role = Role.create(name: "Admin")
Role.create(name: "User")
User.create(email: 'admin@gmail.com', password: 123456, first_name: 'admin', role_id: 'role.id', password_confirmation: 123456)
