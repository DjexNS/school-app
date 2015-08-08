class School < ActiveRecord::Base

	has_many :classrooms
	has_many :pupils

	accepts_nested_attributes_for :pupils
	accepts_nested_attributes_for :classrooms

	def self.generate_pupil_for (school)
		Pupil.create(
			name: FFaker::Name.name,
			gender: FFaker::Gender.random,
			school_id: school.id
			)		
	end
	
	def self.create_classrooms (school)
		name_of_class = (1 % school.number_of_classrooms) + 1
		Classroom.create(
			name: name_of_class,
			school_id: school.id
		)
	end

end
