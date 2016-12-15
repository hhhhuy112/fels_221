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
