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

end
