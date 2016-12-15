class Question < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :learns

  scope :of_category, -> category_id {where category_id: category_id}
  scope :list_learned, -> learned_ids {where id: learned_ids}
  scope :search_content, -> keyword {where "LOWER(content) LIKE ?", "%#{keyword}%"}
  scope :search_by_content, -> content do
    if content
      where "content LIKE ?", "%#{content}%"
    end
  end
  scope :search_by_category, -> category_id do
    where category_id: category_id if category_id.present?
  end
end
