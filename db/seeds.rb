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

puts 'Seeding your app'

Booking.delete_all
ProductsSkill.delete_all
Skill.delete_all
Product.delete_all
User.delete_all
Skill.delete_all



  Skill.create!(name:'caractère')
  Skill.create!(name:'laid')
  Skill.create!(name:'senior')
  Skill.create!(name:'detail')
  Skill.create!(name:'grande taille')
  Skill.create!(name:'petite')
  Skill.create!(name:'beauté')
  Skill.create!(name:'haute couture')



6.times do
  a = User.new(
              first_name: (Faker::Name.first_name),
              last_name: (Faker::Name.last_name),
              email: Faker::Internet.email,
              password: 'tototo',
              password_confirmation: 'tototo'
              )

  (1..3).to_a.sample.times do
    b = a.products.new(
                   first_name: (Faker::Cat.name),
                   last_name: (Faker::Name.last_name),
                   date_of_birth: Faker::Date.birthday(18, 33),
                   phone_number: Faker::PhoneNumber.phone_number,
                   postal_code: Faker::Address.postcode,
                   city: Faker::Address.city,
                   lat: Faker::Address.latitude,
                   latitude: Faker::Address.latitude,
                   lng: Faker::Address.longitude,
                   longitude: Faker::Address.longitude,
                   address: Faker::Address.street_address,
                   price: Faker::Commerce.price,
                   hair: "blond",
                   eyes: "blue",
                   weight: 50,
                   height: 1.88,
                   shoes: 39,
                   description: Faker::Lorem.paragraph,
                   remote_photo_url: 'http://www.potins.net/wp-content/uploads/2014/03/1395241184-d0c1b1c9d4fc5b8b3818af35adfaadbb.jpg'
                   )

    b.products_skills.new(skill_id: Skill.all.sample.id)

    b.save!
  end

  a = User.new(
              first_name: (Faker::Name.first_name),
              last_name: (Faker::Name.last_name),
              email: Faker::Internet.email,
              password: 'tototo',
              password_confirmation: 'tototo'
              )
  a.save!

  a = Booking.new(
                  start_date: Time.now,
                  end_date: Time.now,
                  status: ['pending', 'cancelled', 'valided', 'finished'].sample,
                  description:Faker::Lorem.paragraph,
                  product_id:Product.all.sample.id,
                  user_id:User.all.sample.id
                  )
  a.save!

end

User.create!(
              first_name: 'Carl',
              last_name: 'Job',
              email: 'carl.quivron@gmail.com',
              password: 'bestxx',
              password_confirmation: 'bestxx'
              )
User.create!(
              first_name: 'Augustin',
              last_name: 'Poupard',
              email: 'augustin.poupard@gmail.com',
              password: 'hardelot',
              password_confirmation: 'hardelot'
              )

puts 'Seed Completed'




