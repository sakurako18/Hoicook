
Admin.create!(
   email: 'x@y.com',
   password: '1234567890',
   name: 'からあげ保育園',
)


Tag.create([
  { name: '離乳食5～6か月（ごっくん期）' },
  { name: '離乳食7～8か月（もぐもぐ期）' },
  { name: '離乳食9～11か月（かみかみ期）' },
  { name: '離乳食12～18か月（ぱくぱく期）' },
  { name: '幼児食' }
])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

