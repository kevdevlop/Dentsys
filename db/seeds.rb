# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_master = User.create(
  name: "Usuario master", 
  last_name: "", 
  email: "master@master.com",
  password: "123456789",
  password_confirmation: "123456789",
  user_type: :master_user,
  is_active: true
)

client1 = Client.create(
  razon_social: "Odontokids",
  rfc: "RFC23344553",
  state: "CDMX",
  city: "Iztapalapa",
  zip_code: "09300",
  address: "canal del moral 23",
  logo: "https://w7.pngwing.com/pngs/724/759/png-transparent-apple-logo-apple-computer-icons-apple-logo-heart-computer-logo.png",
  active: true
)

user_admin = User.create(
  name: "Juan", 
  last_name: "Perez", 
  email: "admin@admin.com",
  password: "123456789",
  password_confirmation: "123456789",
  user_type: :admin,
  is_active: true,
  client: client1
)

["Nayarit",
"Nuevo León",
"Oaxaca",
"Puebla",
"Querétaro",
"Quintana Roo",
"San Luis Potosí",
"Sinaloa",
"Sonora",
"Tabasco",
"Tamaulipas",
"Tlaxcala",
"Veracruz",
"Yucatán",
"Zacatecas",
"Ciudad de México",
].each do |state|
  StateCatalogue.create(name: state)
end

boffice = client1.branch_offices.create(
  name: client1.razon_social,
  razon_social: client1.razon_social,
  address: client1.address,
  zip_code: client1.zip_code,
  active: true,
  state_catalogue: StateCatalogue.last
)

[
  "Blanqueamiento Dental",
  "Carillas Dentales",
  "Cirugía Maxilofacial",
  "Coronas Dentales",
  "Endodoncia",
  "Guarda Oclusal",
  "Limpieza Dental",
  "Ortodoncia"
].each do |item|
  Service.create(name: item)
end

[
  "General",
  "Odontopediatria"
].each do |item|
  Speciality.create(name: item)
end

