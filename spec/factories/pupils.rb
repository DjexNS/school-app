require 'ffaker'

FactoryGirl.define do
  factory :pupil do |p|
  	p.name {FFaker::Name.name}
  	#p.sequence(:name) { |n| "student#{n}"}
  	p.gender {FFaker::Gender.random}
  	p.association :school
  end

end
