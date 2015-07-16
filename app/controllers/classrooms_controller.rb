class ClassroomsController < ApplicationController

	def index
		@school = School.find(params[:id])
		@classrooms = @school.classrooms	
	end


end
