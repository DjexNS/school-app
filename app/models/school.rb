class School < ActiveRecord::Base

	has_many :classrooms
	has_many :pupils

	accepts_nested_attributes_for :pupils
	accepts_nested_attributes_for :classrooms

	def self.generate_pupils_for (school)
		Pupil.create(
			name: FFaker::Name.name,
			gender: FFaker::Gender.random,
			classroom_id: 1, #!!!!
			school_id: school.id
			)		
		#Pupil.create_pupils_for school
  	end
	
end
