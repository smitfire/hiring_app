require "faker"

proficiency_array = ["expert", "intermediate", "basic"]

10.times do
  u=User.create!(first: Faker::Name.first_name, last: Faker::Name.last_name, email: Faker::Internet.email, password: "nickpass", avatar: Faker::Avatar.image )
  10.times do
    u.skills.create( name: Faker::Lorem.word, proficiency: proficiency_array.sample )
  end
end


10.times do
  c = Company.create!(name: Faker::Company.name, logo: Faker::Company.logo, description: Faker::Lorem.paragraph(2), website: Faker::Internet.url, moto: Faker::Company.catch_phrase)
  a = c.admins.create!(first: Faker::Name.first_name, last: Faker::Name.last_name, password: "adminpass", email: Faker::Internet.email, title: Faker::Name.title, avatar: Faker::Avatar.image )
  5.times do
    j = a.posted_jobs.create!(title: Faker::Name.title, description: Faker::Lorem.paragraph(10) )
    5.times do
      j.requirements.create(name: Faker::Lorem.word, proficiency: proficiency_array.sample )
    end
  end
end