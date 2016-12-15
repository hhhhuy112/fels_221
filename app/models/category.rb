class Category < ApplicationRecord
  has_many :questions
  has_many :lessons

  scope :order_by_date, -> {order created_at: :desc}
end
