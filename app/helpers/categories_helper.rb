module CategoriesHelper

  def quantity_of_question category
    quantity = Category.find_by_id(category.id).questions.count
    unless quantity
      quantity = 0
    end
    quantity
  end

  def your_result category
    lessons = category.lessons.of_user current_user.id
    result = 0
    if lessons
      lessons.each do |lesson|
        result = result + lesson.learns.is_correct.count
      end
    end
    result
  end

  def is_finished? category_id
    quantity_of_question(category_id) == your_result(category_id)
  end
end
