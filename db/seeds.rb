require "faker"

CompanyAdmin.create!(first: "Nick", last: "Smit", password: "admin")

10.times { User.create!(first: Faker::Name.first_name, last: Faker::Name.last_name, email: Faker::Internet.email, password: "nick" ) }

10.times do
  c = Company.create!(name: Faker::Company.name)
  5.times do
    c.jobs.create!(title: Faker::Lorem.word, description: Faker::Lorem.paragraph)
  end
end