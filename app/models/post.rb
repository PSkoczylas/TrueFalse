class Post < ActiveRecord::Base
  before_save :normalize_link
  before_validation :normalize_link

  has_many :user_answers, dependent: :destroy
  has_many :user, through: :user_answers

  def self.random 
    find(pluck(:id).sample)
  end
end
