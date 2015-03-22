require "faker"

proficiency_array = ["expert", "intermediate", "basic"]

10.times do
  u=User.create!(first: Faker::Name.first_name, last: Faker::Name.last_name, email: Faker::Internet.email, password: "nickpass" )
  10.times do
    u.skills.create( name: Faker::Lorem.word, proficiency: proficiency_array.sample )
  end
end


10.times do
  c = Company.create!(name: Faker::Company.name)
  a = c.admins.create!(first: "Nick", last: "Smit", password: "adminpass", email: Faker::Internet.email, title: Faker::Hacker.say_something_smart )
  5.times do
    j = a.posted_jobs.create!(title: Faker::Lorem.word, description: Faker::Lorem.paragraph(3) )
    5.times do
      j.requirements.create(name: Faker::Lorem.word, proficiency: proficiency_array.sample )
    end
  end
end