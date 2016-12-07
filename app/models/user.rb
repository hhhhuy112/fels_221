class User < ApplicationRecord
  before_save {email.downcase!}

  has_many :activities
  has_many :lessons

  validates :name, presence: true, length: {maximum: Settings.model_user.name_maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.model_user.email_maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.model_user.password_minimum}
end
