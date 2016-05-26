require 'faker'

FactoryGirl.define do
  factory :post do |f|
    f.body { "To jest przykładowy fakt" }    
    f.answer { true }
    f.comment { "Przykładowy fakt to prawda" }
    f.link { "http://link.org" }
  end
end
