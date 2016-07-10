class Post < ActiveRecord::Base
  has_many :user_answers, dependent: :destroy
  has_many :user, through: :user_answers

  has_many :post_category, dependent: :destroy
  has_many :category, through: :post_category
  
  validates :body, presence: true, length: {maximum: 50},
                    uniqueness: { case_sensitive: false }

  def self.random 
    find(pluck(:id).sample)
  end
end
