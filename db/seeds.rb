#CLEAR DATABASE BEFORE SEEDING!
# Hard-coded single set

User.create(
  name: "test_username",
  email: "test@email.com",
  password_hash: 'password'
  )

Question.create(
  user_id: 1,
  title: 'Test Question Title',
  text: 'This is example text for the test question'
  )

Answer.create(
  user_id: 1,
  question_id: 1,
  text: 'This is a test answer to the first question'
  )

Comment.create(
  user_id: 1,
  commentable_id: 1,
  commentable_type: 'Question',
  text: 'test comment for first Question'
  )

Comment.create(
  user_id: 1,
  commentable_id: 2,
  commentable_type: 'Answer',
  text: 'test comment for first Answer'
  )

Vote.create(
  user_id: 1,
  votable_id: 1,
  votable_type: 'Question',
  approval: true
  )

Vote.create(
  user_id: 1,
  votable_id: 1,
  votable_type: 'Answer',
  approval: true
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
  Question.create(
    user_id: (rand(6) + 1),
    title: Faker::Hacker.ingverb.capitalize + ' ' + Faker::Hacker.adjective + ' ' + Faker::Hacker.noun,
    text: Faker::Lorem.paragraph
  )
end

10.times do |i|
Answer.create(
  user_id: (rand(6) + 1),
  question_id: (i + 1),
  text: Faker::Hacker.say_something_smart
  )
end

20.times do |i|
Comment.create(
  user_id: (rand(6) + 1),
  commentable_id: (rand(10) + 1),
  commentable_type: ['Question','Answer'].sample,
  text: Faker::Hacker.say_something_smart
  )
end

30.times do |i|
Vote.create(
  user_id: (rand(6) + 1),
  votable_id: (rand(10) + 1),
  votable_type: ['Question','Answer'].sample,
  approval: [true,false].sample
  )
end


