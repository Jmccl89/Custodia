# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'James McCloskey',
             email: 'james@mccloskey.io',
             password: 'password',
             password_confirmation: 'password',
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

Equipment.create!(name: 'Unit 59',
                  description: 'Ferrari La Ferrari',
                  serial: '1234ABCD',
                  purchase_date: '2012-10-25')

Equipment.create!(name: 'Unit 60',
                  description: 'Chevrolet Silverado 2008',
                  serial: '123456678',
                  purchase_date: '2012-10-25',
                  secondary_hours_label: 'Hours')

Equipment.create!(name: 'Unit 61',
                  description: 'Dodge Durango 2007',
                  serial: '123CBA',
                  purchase_date: '2012-10-25')

Equipment.create!(name: 'Unit 11',
                  description: 'Ford F-150 2000',
                  serial: 'BBBBAAAA',
                  purchase_date: '2012-10-25')

equipments = Equipment.take(4)
50.times do
  content = Faker::Lorem.sentence(3)
  equipments.each do |equipment|
    equipment.entries.create!(date: Date.jd(Random.rand(2_456_000..2_456_999)),
                              content: content,
                              mileage: 197_000,
                              employee: 'Thomas')
  end
end
