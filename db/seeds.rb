# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
g1 = Gender.create({name: 'Masculino'})
g2 = Gender.create({name: 'Feminino'})
User.create({name: 'Carlos Fagiani Junior', gender: g1, cpf:'09876543211', email:'fagianijunior@gmail.com', password:'password', password_confirmation:'password', admin_role:true})
