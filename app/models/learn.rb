class Learn < ApplicationRecord
  belongs_to :question
  belongs_to :answer, optional: true
  belongs_to :lesson

  scope :learned_ids, -> user_id, category_id do
    lessons = Lesson.where category_id: category_id, user_id: user_id
    self.add_question_id lessons
  end

  scope :learned_ids_without_category, -> user_id do
    lessons = Lesson.where user_id: user_id
    self.add_question_id lessons
  end

  scope :add_question_id, -> lessons do
    learned_ids = []
    lessons.each do |lesson|
      lesson.learns.where(is_correct: true).each do |learn|
        learned_ids << learn.question_id
      end
    end
    learned_ids
  end

  scope :is_correct?, -> {where is_correct: true}
  
  def self.check_correct_answer answer_id
    unless answer_id
      return false
    end
    Answer.find_by_id(answer_id).is_correct
  end
end
