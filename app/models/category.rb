class Category < ActiveRecord::Base
  has_many :post_category, dependent: :destroy
  has_many :post, through: :post_category
end
