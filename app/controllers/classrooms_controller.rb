class ClassroomsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :verification
	require 'ffaker'
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


	def index
		@school = School.find(params[:school_id])
		@classrooms = Classroom.where(:school_id => @school.id)	
		classroom = Classroom.find(params[:id])
		@total_count = Pupil.where(:classroom_id => classroom.id).count
	end

	def new
		#@classroom = Classroom.new
	end

	def show
		@classroom = Classroom.find(params[:id])
		@school = School.find(params[:school_id])
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def classroom_params
		params.require(:classroom).permit(:name, :number_of_pupils, :school_id)
	end

	def record_not_found
		render file: 'public/404'
  	end
end
