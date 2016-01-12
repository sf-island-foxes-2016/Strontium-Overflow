#CLEAR DATABASE BEFORE SEEDING!
# Hard-coded single set

User.create(
  name: "test_username",
  email: "test@email.com",
  password_hash: 'password'
  )

Post.create(
  user_id: 1,
  title: 'Test Question Title',
  url: 'www.google.com'
  )


Comment.create(
  user_id: 1,
  post_id: 1,
  text: 'Test comment for first post'
  )

Comment.create(
  user_id: 1,
  post_id: 1,
  text: 'Second test comment for post'
  )



# ---------------
# rando set
# -------------

5.times do |i|
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_hash: 'password'
  )
end

10.times do |i|
  Post.create(
    user_id: (rand(6) + 1),
    title: Faker::Hacker.ingverb.capitalize + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun,
    url: Faker::Internet.url
  )
end

# 10.times do |i|
# Answer.create(
#   user_id: (rand(6) + 1),
#   question_id: (i + 1),
#   text: Faker::Hacker.say_something_smart
#   )
# end

20.times do |i|
Comment.create(
  user_id: (rand(6) + 1),
  post_id: (rand(10) + 1),
  text: Faker::Hacker.say_something_smart
  )
end

# 30.times do |i|
# Vote.create(
#   user_id: (rand(6) + 1),
#   votable_id: (rand(10) + 1),
#   votable_type: ['Question','Answer'].sample,
#   approval: [true,false].sample
#   )
# end


