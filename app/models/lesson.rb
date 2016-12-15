class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :learns

  accepts_nested_attributes_for :learns, allow_destroy: true

  scope :get_lesson_belongsto_user, -> user_id {where user_id: user_id}
  scope :get_lesson_belongsto_category, -> category_id, user_id do
    where user_id: user_id, category_id: category_id
  end
end
