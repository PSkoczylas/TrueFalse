class Post < ActiveRecord::Base
  has_many :user_answers, dependent: :destroy
  has_many :user, through: :user_answers

  def self.random 
    Post.find(rand(first.id.. last.id))
    #find(:first, :order => "RAND()", :conditions => "created_at < '#{Time.now.to_s(:db)}'")
  end
end
