# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Destroy all'
# User.destroy_all
# Property.destroy_all
puts 'Seeding - START'

def user_verify(user)
  if user.save
    print 'User '
    print user.name
    puts ' created successfully!'
  else
    puts user.errors.full_messages.join(', ')
  end
end


puts 'Seeding Users'
mathias = User.create(name: 'mathias', email: 'mathias@mail.com', phone: '95254321', password: '123456')
user_verify(mathias)
juan = User.create(name: 'juan', email: 'juan@mail.com', phone: '93824323', password: '123456')
user_verify(juan)
maria = User.create(name: 'maria', email: 'maria@mail.com', phone: '945654323', password: '123456')
user_verify(maria)
divurcio = User.create(name: 'divurcio', email: 'divurcio@mail.com', phone: '92354323', password: '123456')
user_verify(divurcio)
yhos = User.create(name: 'yhos', email: "yhost@mail.com", phone: '92354323', password: '123456')
user_verify(yhos)
# marketing.cover.attach(io: File.open("db/images/mkt_cover.png"), filename: "mkt_cover.png")
def property_verify(property)
  if property.save
    print 'Property from ===>'
    print property.address
    puts '<=== created successfully!'
  else
    puts property.errors.full_messages.join(', ')
  end
end
apartment1 = Property.create(operation_type: 0, address: '1500 Sugar Bowl Dr, New Orleans, LA 70112, USA',
                        property_type: 0, price: 3000, maintenance: 100, 
                        bedrooms_count: 4, bathrooms_count: 2, area: 180,
                        description: 'Departamento centrico cerca a supermercado, estacion del tren y servicios completos agua, luz, telefono y gas',
                        active_published: true, pets_allowed: true, user_id: 1)
apartment1.images.attach(io: File.open("db/images/Rectangle 17house (1).png"), filename: "apartment1.png")
apartment1.images.attach(io: File.open("db/images/Rectangle 17house (2).png"), filename: "apartment2.png")
apartment1.images.attach(io: File.open("db/images/Rectangle 17house (3).png"), filename: "apartment3.png")

puts apartment1.property_type
property_verify(apartment1)



apartment2 = Property.create(operation_type: 'rent', address: 'Avenida San Martín 803, Suero Canto, Obrero, Yauri, Espinar, Cusco, Peru',
                        price: '2500', maintenance: 90, property_type: 'apartment',
                        bedrooms_count: '3', bathrooms_count: '1', area: '150',
                        description: 'Departamento con completos agua, luz, telefono y gas',
                        active_published: true, pets_allowed: true, user_id: 2)
apartment2.images.attach(io: File.open("db/images/Rectangle 17house (2).png"), filename: "apartment2.png")
                
property_verify(apartment2)


# abajo esta bien
apartment3 = Property.create(operation_type: 'rent', address: 'Nicolás de Pierola Avenue 583, Lima Metropolitan, Lima, Peru',
                        price: '3800', maintenance: 80, property_type: 'apartment',
                        bedrooms_count: '5', bathrooms_count: '3', area: '200',
                        description: 'Departamento  cerca a estacion del tren y servicios completos agua, luz, telefono y gas',
                        active_published: true, pets_allowed: true, user_id: 3)
apartment3.images.attach(io: File.open("db/images/Rectangle 17house (3).png"), filename: "apartment3.png")

property_verify(apartment3)


casa4 = Property.create(operation_type: 'sale', address: 'Jirón Javier Luna Pizarro 156, Matute, La Victoria,Lima, Peru',
    price: '200000', property_type: 'house',
    bedrooms_count: '4', bathrooms_count: '2', area: '180',
    description: 'Casassssssssssssss  cerca a estacion del tren y servicios completos agua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 4)
casa4.images.attach(io: File.open("db/images/Rectangle 17house (4).png"), filename: "casa4.png")
property_verify(casa4)

casa5 = Property.create(operation_type: 'sale', address: 'Av. Juan Pablo II 583, Lima, Peru',
    price: '200000', property_type: 'house',
    bedrooms_count: '4', bathrooms_count: '2', area: '180',
    description: 'aaaaaaaaaaCsdfgsdfgcvbxcasa  cerca a estacion del tren y servicios completos agua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 5)
casa5.images.attach(io: File.open("db/images/Rectangle 17house (5).png"), filename: "casa5.png")
property_verify(casa5)

casa6 = Property.create(operation_type: 'sale', address: 'Av. Juan Pablo II 583, Lima, Peru',
    price: '200000', property_type: 'house',
    bedrooms_count: '4', bathrooms_count: '6', area: '324',
    description: 'Cacvbvvvvvvvvsa  cerca a estacion del tren y servicios completos agua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 3)
casa6.images.attach(io: File.open("db/images/Rectangle 17house (6).png"), filename: "casa6.png")
property_verify(casa6)

casa7 = Property.create(operation_type: 'rent', address: 'Av. Juan Pablo II 583, Lima, Peru',
    price: '12314', property_type: 'apartment',
    bedrooms_count: '41', bathrooms_count: '25', area: '180',
    description: 'FFFFFFFFFFFFFasdsadasdasden y servicios completos agua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 3)
casa7.images.attach(io: File.open("db/images/Rectangle 17house (7).png"), filename: "casa7.png")
property_verify(casa7)

department8 = Property.create(operation_type: 'rent', address: 'Av. Juan Pablo II 583, Lima, Peru',
    price: '1243314', property_type: 'apartment',
    bedrooms_count: '4131', bathrooms_count: '254', area: '180',
    description: 'ua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 3)
department8.images.attach(io: File.open("db/images/Rectangle 17house (8).png"), filename: "department8.png")
property_verify(department8)

department9 = Property.create(operation_type: 'rent', address: 'Av. Juan Pablo II 583, Lima, Peru',
    price: '12', property_type: 'apartment',
    bedrooms_count: '14', bathrooms_count: '254', area: '180',
    description: 'SSSSSSSSSSSSSSSServicios completos agua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 3)
department9.images.attach(io: File.open("db/images/Rectangle 17house (9).png"), filename: "department9.png")
property_verify(department9)


department10 = Property.create(operation_type: 'rent', address: 'Av. Juan Pablo II 583, Lima, Peru',
    price: '12', property_type: 'apartment',
    bedrooms_count: '14', bathrooms_count: '254', area: '180',
    description: 'CCCCCCCCCCCCCCCCCCCCCCCCCCCAAAAAAA completos agua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 3)
department10.images.attach(io: File.open("db/images/Rectangle 17house (10).png"), filename: "department10.png")
property_verify(department10)

department11 = Property.create(operation_type: 'rent', address: 'Av. Juan Pablo II 583, Lima, Peru',
    price: '12', property_type: 'apartment',
    bedrooms_count: '14', bathrooms_count: '254', area: '180',
    description: '%%%%%%%%%%%%% completos agua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 3)
department11.images.attach(io: File.open("db/images/Rectangle 17house (11).png"), filename: "department11.png")
property_verify(department11)

department12 = Property.create(operation_type: 'rent', address: 'Av. Juan Pablo II 583, Lima, Peru',
  price: '1244', property_type: 'apartment',
  bedrooms_count: '14', bathrooms_count: '254', area: '180',
  description: ' )))))))))))))) completos agua, luz, telefono y gas',
  active_published: true, pets_allowed: true, user_id: 3)
department12.images.attach(io: File.open("db/images/Rectangle 17house (11).png"), filename: "department11.png")
department12.images.attach(io: File.open("db/images/Rectangle 17house (11).png"), filename: "department11.png")
department12.images.attach(io: File.open("db/images/Rectangle 17house (11).png"), filename: "department11.png")

property_verify(department12)

department13 = Property.create(operation_type: 'rent', address: 'Av. Juan Pablo II 583, Lima, Peru',
    price: '1244', property_type: 'apartment',
    bedrooms_count: '14', bathrooms_count: '254', area: '180',
    description: ' ))))))))))) completos agua, luz, telefono y gas',
    active_published: true, pets_allowed: true, user_id: 3)
department13.images.attach(io: File.open("db/images/Rectangle 17house (11).png"), filename: "department11.png")
department13.images.attach(io: File.open("db/images/Rectangle 17house (11).png"), filename: "department11.png")
department13.images.attach(io: File.open("db/images/Rectangle 17house (11).png"), filename: "department11.png")

property_verify(department13)