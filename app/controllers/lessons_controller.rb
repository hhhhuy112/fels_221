class LessonsController < ApplicationController

  def index
    @lessons = Lesson.get_lesson_belongsto_category(params[:category_id], current_user.id)
  end

  def show
    @lesson = Lesson.find_by_id params[:id]
    @results = @lesson.learns
  end

  def new
    category = Category.find_by_id params[:category_id]
    learned_ids = Learn.learned_ids current_user.id, category.id
    if learned_ids.empty?
      questions = category.questions.take(5)
    else
      questions = category.questions.question_not_learn(learned_ids).take(5)
    end
    @lesson = category.lessons.build
    questions.each do |question|
      @lesson.learns.build question_id: question.id
    end
  end

  def create
    @lesson = current_user.lessons.build category_id: params[:category_id]
    learns = params[:lesson][:learns_attributes]
    if @lesson.save
      learns.each do |key, value|
        @lesson.learns.create!(answer_id: value["answer_id"],
                              question_id: value["question_id"],
                              is_correct: Learn.check_correct_answer(value["answer_id"]))
      end
      score = @lesson.learns.is_correct?.count
      @lesson.update(score: score)
      Activity.create!(user_id: current_user.id, action: 3, source: @lesson.id)
      redirect_to category_lesson_path(@lesson.category, @lesson)
    else
      render :new
    end
  end
end
