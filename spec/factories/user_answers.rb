require 'faker'

FactoryGirl.define do
  factory :user_answer do |f|
    f.user_id { 1 }    
    f.post_id { 1 }
    f.answer { false }
  end
end
