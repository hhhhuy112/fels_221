class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :learns

  scope :of_category, -> category_id {where category_id: category_id}
  scope :list_learned, -> learned_ids {where id: learned_ids}
  scope :search_content, -> keyword {where "LOWER(content) LIKE ?", "%#{keyword}%"} 
  scope :question_not_learn, -> learned_ids {where "id NOT IN (?)", learned_ids}
end
