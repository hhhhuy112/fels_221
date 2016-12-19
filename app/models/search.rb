class Search < ApplicationRecord
  
  def search_words user
    words = Question.all
    words = words.search_content if keyword.present?
    if category.present?
      learned_ids = Learn.learned_ids user.id, category
      words = words.of_category
    else
      learned_ids = Learn.learned_ids_without_category user.id
    end
    had_learned learned_ids, learn, words
  end

  def had_learned learned_ids, learn, words
    if learn
      words = words.list_learned learned_ids
    elsif learned_ids.any? && !learn 
      words = words.question_not_learn learned_ids
    end
    words
  end
end
