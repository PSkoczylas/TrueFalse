class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_answers, dependent: :destroy
  has_many :post, through: :user_answers

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50},
                    uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
end
