require 'ffaker'

FactoryGirl.define do
  factory :school do |s|
    s.title "Jovina"
    s.number_of_pupils 110
  end

  factory :classroom do |p|
    p.sequence(:name) { |n| "#{n}"}
  end
end