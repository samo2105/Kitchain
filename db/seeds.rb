# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Commerce.destroy_all
Office.destroy_all
Worker.destroy_all
Table.destroy_all
Product.destroy_all
Sale.destroy_all

Commerce.create(name:'Example', rol: 99999999, number: 40167793, adress: 'Av. falsa 123', email:'example@mail.com', password: '123123', password_confirmation: '123123')
Office.create(commerce_id: Commerce.last.id, name: 'oficina 1', adress: 'Av. falsa 321', number: 40167793)
Worker.create(office_id: Office.last.id, name: "Trabajador admin", rol: (1234567), adress: "Av. falsa 3295", admin: true, email: 'workeradmin@mail.com', password:'123123', password_confirmation: '123123')

3.times do |i|
  Worker.create(office_id: Office.last.id, name: "Trabajador #{i+1}", rol: (123456 + i), adress: "Av. falsa 32#{i}", admin: false, email: "worker#{i+1}@mail.com", password:'123123', password_confirmation: '123123')
  Table.create(size: i+1, description: "mesa para #{i+1}")
  Product.create(name: "Producto #{i+1}", quantity: i+3, price: 2000, office_id: Office.last.id)
  Sale.create(worker_id: Worker.last.id, total: 123123, payed: false, comment: 'La mía sin queso', table_id: Table.last.id)

  3.times {|i| Order.create(product_id: Product.last.id, quantity: i+1, sale_id: Sale.last.id, amount: Product.last.price)}
end
