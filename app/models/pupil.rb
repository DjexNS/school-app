class Pupil < ActiveRecord::Base
	enum gender: [:male, :female]
	
	belongs_to :classroom
	belongs_to :school

	def male?
		self.gender == 'male'
	end

	def female?
		self.gender == 'female'
	end

=begin	
	def self.create_pupils_for (school)		
			Pupil.create(
			name: FFaker::Name.name,
			gender: FFaker::Gender.random,
			classroom_id: 1, #!!!!
			school_id: school.id
			)		
	end
=end



end
