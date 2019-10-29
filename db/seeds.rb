# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Order.destroy_all
Sale.destroy_all
Product.destroy_all
Table.destroy_all
Worker.destroy_all
Office.destroy_all
Commerce.destroy_all

Commerce.create(name:Faker::Company.name, rol: rand(1111111..9999999), number: rand(1111111..9999999), adress: 'Av. falsa 123', email:'example@mail.com', password: '123123', password_confirmation: '123123')

  10.times {Office.create(commerce_id: Commerce.last.id, name: Faker::Company.name, adress: Faker::Address.street_address, number: 40167793)}
  60.times {Worker.create(office_id: Office.all.sample.id, name: Faker::Name.name, rol: rand(1111111..9999999), adress: Faker::Address.street_address, admin: false, email: Faker::Internet.email, password:'123123', password_confirmation: '123123', commerce_id: Commerce.last.id)}
  50.times {Table.create(size: rand(0..10), description: Faker::Lorem.sentence, office_id: Office.all.sample.id)}
  25.times {Product.create(name: Faker::Food.dish, quantity: rand(100), price: 2000, office_id: Office.all.sample.id)}
  50.times {Sale.create(worker_id: Worker.all.sample.id, total: rand(10000), payed: false, comment: 'La mía sin queso', table_id: Table.last.id, office_id: Office.all.sample.id, created_at: rand(1.years).seconds.ago, commerce_id: Commerce.all.sample.id)}
  100.times {Order.create(product_id: Product.all.sample.id, quantity: rand(1..5), sale_id: Sale.all.sample.id, amount: rand(2000))}

Worker.create(office_id: Office.last.id, name: "Trabajador admin", rol: (1234567), adress: "Av. falsa 3295", admin: true, email: 'workeradmin@mail.com', password:'123123', password_confirmation: '123123')
