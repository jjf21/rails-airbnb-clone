# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Erasing all the DB'
User.destroy_all

puts 'Seeding your app'
status = ['pending', 'cancelled', 'valided', 'finished']

10.times do
  a = User.new(
              first_name: (Faker::Name.first_name),
              last_name: (Faker::Name.last_name),
              email: Faker::Internet.email,
              password: 'tototo',
              password_confirmation: 'tototo'
              )

   (1..3).to_a.sample.times do
       a.products.new(
                 first_name: (Faker::Cat.name),
                 last_name: (Faker::Name.last_name),
                 date_of_birth: Faker::Date.birthday(18, 33),
                 phone_number: Faker::PhoneNumber.phone_number,
                 postal_code: Faker::Address.postcode,
                 city: Faker::Address.city,
                 lat: Faker::Address.latitude,
                 lng: Faker::Address.longitude,
                 address: Faker::Address.street_address,
                 price: Faker::Commerce.price,
                 hair: "blond",
                 eyes: "blue",
                 weight: 50,
                 height: 1.88,
                 shoes: 39,
                 description: Faker::Lorem.paragraph
                 )

         end
        a.save!
      end

                #a = Reservation.new(
                             # start_date: Faker::Date.forward(100),
                             # end_date: Faker::Date.forward(100),
                             # status: status.sample,
                              #description:Faker::Lorem.paragraph
                              #)

puts 'Seed Completed'




