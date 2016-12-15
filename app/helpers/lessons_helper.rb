module LessonsHelper
  def get_answers id
    answers = []
    question = Question.find_by id: id
    question.answers.each do |answer|
      answers << answer
    end
    answers.shuffle
  end

  def get_question id
    question = Question.find_by id: id
    is_null? question
  end

  def your_answer id
    answer = Answer.find_by id: id
    is_null? answer
  end

  def correct_answer id
    correct_answer = Answer.find_by question_id: id, is_correct: true
    is_null? correct_answer
  end

  def is_null? obj
    unless obj
      return ""
    end
    obj.content
  end

  def get_index index, page
    Settings.lessons_controller.per_page * (page - 1) + index + 1
  end  
end
