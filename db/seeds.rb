# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do 
  lotr = Faker::LordOfTheRings.character
  Student.create([ 
    {first_name: lotr}, 
    {last_name: Faker::Name.first_name}, 
    {email: Faker::Internet.email},
    {phone_number: Faker::PhoneNumber.cell_phone},
    {short_bio: Faker::Overwatch.quote},
    {linkedin_url: 'www.linked.com/users/'+lotr},
    {twitter_handle: '@'+Faker::lotr},
    {personal_blog_url: 'www.medium.com/'+lotr},
    {online_resume_url: 'www.resume.com/' + lotr},
    {github_url: 'www.github.com/u/' + lotr},
    {photo_url: 'www.imgur.com/sample.jpg'}
])

20.times do
  Experience.create ([
  {student_id: rand(1..10)},
  {start_date: Time.now}, #TODO
  {end_date: Time.now},
  {job_title: Faker::Job.title},
  {company_name: Faker::Company.name},
  {details: Faker::Company.catch_phrase},
])

20.times do
  Education.create ([
  {student_id: rand(1..10)},
  {start_date: Time.now},
  {end_date: Time.now},
  {degree: Faker::Job.title},
  {university_name: Faker::Company.name},
  {details: Faker::Company.catch_phrase}
])

20.times do
  Skill.create ([
    {student_id: rand(1..10)},
    {skill_name: 'ruby'}
  ])

20.times do
  Capstone.create ([
    {student_id: rand(1..10)},
    {name: Faker::Company.name},
    {description: Faker::Company.catch_phrase},
    {url: 'www.'+Faker::Company.name+'.com'}
  ])