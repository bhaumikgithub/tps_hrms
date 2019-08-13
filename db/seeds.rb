# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
company = Company.create(comp_email: 'tps@gmail.com', comp_name: 'tps', subdomain: 'tsp')
User.create(email: 'admin@gmail.com', password: "123456", first_name: 'admin', company: company)
User.create(email: 'nency@gmail.com', password: "123456", first_name: 'nency')
User.create(email: 'kinjal@gmail.com', password: "123456",first_name: 'kinjal')
User.create(email: 'tanay@gmail.com', password: "123456",first_name: 'tanay')
User.create(email: 'parul@gmail.com', password: "123456",first_name: 'parul')
User.create(email: 'neha@gmail.com', password: "123456",first_name: 'neha')
