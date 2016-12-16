module SearchesHelper
  def is_learned? question_id
    learned_ids = Learn.learned_ids_without_category current_user
    learned_ids.include? question_id
  end
end
