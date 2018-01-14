# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ce = State.create({name: 'Ceará', abbreviation: 'CE'})
fortal = City.create({name: 'Fortaleza', state: ce})
passare = District.create({name: 'Passaré', city: fortal})
messejana = District.create({name: 'Messejana', city: fortal})

g1 = Gender.create({name: 'Masculino'})
g2 = Gender.create({name: 'Feminino'})
admin = User.create({name: 'Carlos Fagiani Junior', gender: g1, cpf:'09876543211', email:'fagianijunior@gmail.com', password:'password', password_confirmation:'password', admin_role:true })
Address.create({user: admin, zipcode: '60749050', state: ce, city: fortal, district: passare, street: 'Rua 03H', number: '199', complement: 'Casa 03, Bloco H'})
Phone.create([{user: admin, number: '85985952866', whatsapp: true},{user: admin, number: '85876768876', whatsapp: false}])

robson = User.create({name: 'Robson Lomonte', gender: g1, cpf:'12345678900', email:'lomonte@lomonte.com.br', password:'123456', password_confirmation:'123456', admin_role:true })
Address.create({user: robson, zipcode: '60840-115', state: ce, city: fortal, district: messejana, street: 'Rua Joaquim Felício', number: '909'})
Phone.create({user: robson, number: '85912345678', whatsapp: true})
