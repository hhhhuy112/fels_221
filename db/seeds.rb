10.times do
  cat = Category.create! name: Faker::App.name, picture: Faker::Avatar.image
  10.times do
    ques = Question.create! content: Faker::App.name, category_id: cat.id
    4.times do |n|
      if n == 3
        Answer.create! content: Faker::App.name + Settings.seed.correct_answer, is_correct: true, question_id: ques.id
      else
        Answer.create! content: Faker::App.name, is_correct: false, question_id: ques.id
      end
    end
  end
end

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             role: 1)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               role: 0)
end
