class Post < ActiveRecord::Base
  has_many :user_answers, dependent: :destroy
  has_many :user, through: :user_answers
end
