# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Weekday.create([{name:'Domingo', abbreviation:'Dom'},{name:'Segunda', abbreviation:'Seg'},{name:'Terça', abbreviation:'Ter'},{name:'Quarta', abbreviation:'Qua'},{name:'Quinta', abbreviation:'Qui'},{name:'Sexta', abbreviation:'Sex'},{name:'Sábado', abbreviation:'Sab'}])
HairSize.create([
  {name: 'Curto', icon: 'mysalon-woman-short-hair'},
  {name: 'Médio', icon: 'mysalon-woman-medium-hair'},
  {name: 'Longo', icon: 'mysalon-woman-long-hair'}])
Category.create([
  {name: 'Cabelo', has_size: true, icon: 'mysalon-woman-hair'},
  {name: 'Manicure', icon: 'mysalon-manicure-nail-style'},
  {name: 'Depilação', icon: 'mysalon-depilation-wax'},
  {name: 'Estética', icon: 'mysalon-woman-blush'}])

ce = State.create({name: 'Ceará', abbreviation: 'CE'})
fortal = City.create({name: 'Fortaleza', state: ce})
passare = District.create({name: 'Passaré', city: fortal})
messejana = District.create({name: 'Messejana', city: fortal})

g1 = Gender.create({name: 'Masculino'})
g2 = Gender.create({name: 'Feminino'})
g3 = Gender.create({name: 'Unissex'})
ghost = User.create({name: 'Carlos Fagiani Junior', gender: g1, cpf:'09876543211', email:'fagianijunior@gmail.com', password:'password', password_confirmation:'password', ghost_role:true, user_role:false })
Address.create({user: ghost, zipcode: '60749050', state: ce, city: fortal, district: passare, street: 'Rua 03H', number: '199', complement: 'Casa 03, Bloco H'})
Phone.create([{user: ghost, number: '85985952866', whatsapp: true},{user: ghost, number: '85876768876', whatsapp: false}])

robson = User.create({name: 'Robson Lomonte', gender: g1, cpf:'12345678900', email:'lomonte@lomonte.com.br', password:'123456', password_confirmation:'123456', admin_role:true })
Address.create({user: robson, zipcode: '60840-115', state: ce, city: fortal, district: messejana, street: 'Rua Joaquim Felício', number: '909'})
Phone.create({user: robson, number: '85912345678', whatsapp: true})

salao = Salon.create({name: 'Salão um', zipcode: '43321566', state: ce, city: fortal, district: messejana, street: 'Rua dois', number: '344'})

cliente             = User.create({name: 'Cliente um', gender: g1, cpf:'12312312312', email:'clienteum@cliente.com.br', password:'1qaz2wsx', password_confirmation:'1qaz2wsx' })
usuario_funcionario = User.create({name: 'Funcionario um', gender: g2, cpf:'09876545211', email:'funcionarioum@funcionario.com.br', password:'1qaz2wsx', password_confirmation:'1qaz2wsx' })

corte_masculino = Service.create([
  {name: 'Corte', category: Category.find_by(name: 'Cabelo'), gender: g1, hair_size: HairSize.find_by(name: 'Curto'), minimum_time: '2000-01-01 00:10:00', maximum_time: '2000-01-01 00:30:00', price: 0.3e2, icon: 'mysalon-man-short-hair'},
  {name: 'Corte', category: Category.find_by(name: 'Cabelo'), gender: g1, hair_size: HairSize.find_by(name: 'Médio'), minimum_time: '2000-01-01 00:20:00', maximum_time: '2000-01-01 00:40:00', price: 0.3e2, icon: 'mysalon-man-medium-hair'},
  {name: 'Corte', category: Category.find_by(name: 'Cabelo'), gender: g1, hair_size: HairSize.find_by(name: 'Longo'), minimum_time: '2000-01-01 00:30:00', maximum_time: '2000-01-01 00:50:00', price: 0.3e2, icon: 'mysalon-man-long-hair'}])

corte_feminino  = Service.create([
  {name: 'Corte', category: Category.find_by(name: 'Cabelo'), gender: g2, hair_size: HairSize.find_by(name: 'Curto'), minimum_time: '2000-01-01 00:50:00', maximum_time: '2000-01-01 01:00:00', price: 0.3e2, icon: 'mysalon-woman-short-hair'},
  {name: 'Corte', category: Category.find_by(name: 'Cabelo'), gender: g2, hair_size: HairSize.find_by(name: 'Médio'), minimum_time: '2000-01-01 01:00:00', maximum_time: '2000-01-01 01:20:00', price: 0.3e2, icon: 'mysalon-woman-medium-hair'},
  {name: 'Corte', category: Category.find_by(name: 'Cabelo'), gender: g2, hair_size: HairSize.find_by(name: 'Longo'), minimum_time: '2000-01-01 01:10:00', maximum_time: '2000-01-01 01:20:00', price: 0.3e2, icon: 'mysalon-woman-long-hair'}])


funcionario = Employee.create({user: usuario_funcionario, nis: '567567567567', services: corte_masculino, salons: [salao] })
