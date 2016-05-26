require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.name }    
    f.email { "zdzich@siemacho.com" }
    f.password { "abc123A" }
    f.password_confirmation { "abc123A" }
  end
end
