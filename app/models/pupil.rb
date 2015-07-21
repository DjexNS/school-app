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

	def self.distribute_pupil_for (school)
		@school = school
		
		@total_count = Pupil.where(school_id: @school.id).count
		@male_pupils = Pupil.where(gender: '0', school_id: @school.id).count 
		@female_pupils = @total_count - @male_pupils

		@pupils_per_classroom = @total_count / @school.number_of_classrooms
		@malePupilsPerClassroom = ((@male_pupils.to_f/@total_count.to_f) * @pupils_per_classroom).to_i
		@femalePupilsPerClassroom = @pupils_per_classroom - @malePupilsPerClassroom

		male_counter=1
		female_counter=1

		Pupil.where(school_id: @school.id, gender: '0').find_each do |ppl|
  			classroom_male=male_counter % @school.number_of_classrooms
  			male_counter += 1
  				if classroom_male==0
  					classroom_male=@school.number_of_classrooms
  				end
			ppl.update(classroom_id: classroom_male)
		end

		Pupil.where(school_id: @school.id, gender: '1').find_each do |ppl|
  			classroom_female = female_counter % @school.number_of_classrooms
  			female_counter += 1
				if classroom_female==0
					classroom_female=@school.number_of_classrooms
				end
			ppl.update(classroom_id: classroom_female)
			
		end
	end
end
