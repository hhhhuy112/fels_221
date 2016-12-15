class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :learns

  scope :question_not_learn, -> learned_ids {where 'id NOT IN (?)', learned_ids}
end
