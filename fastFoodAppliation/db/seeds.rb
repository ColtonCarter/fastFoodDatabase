# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.delete_all
Email.delete_all
EmployeeHasShift.delete_all
Employee.delete_all
InvoiceHasProduct.delete_all
Invoice.delete_all
Person.delete_all
Phone.delete_all
Position.delete_all
Product.delete_all
Shift.delete_all
Status.delete_all

