class PostCategory < ActiveRecord::Base
  has_many :post 
  has_many :category
end
