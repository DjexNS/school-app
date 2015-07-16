class School < ActiveRecord::Base

  has_many :classrooms
	has_many :pupils

	accepts_nested_attributes_for :pupils
	accepts_nested_attributes_for :classrooms


	
end
