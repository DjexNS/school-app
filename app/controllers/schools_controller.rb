class SchoolsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :verification
	require 'ffaker'
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index
		@schools = School.all
	end


	def new
		@school = School.new		
	end


	def create 
		@school = School.new(school_params) 
		if @school.save 
		  redirect_to action: :show, id: @school.id, notice: "New school created!"
		else 
		  render 'new' 
		end			
	end


	def show
		@school = School.find(params[:id])
		redirect_to controller: 'pupils', action: 'index', school_id: params[:id]		
	end


	def edit
		@school = School.find(params[:id])
	end


	def update
		@school = School.find(params[:id])
		if @school.update(school_params)
			redirect_to school_path, notice: "School updated."
		else
			render 'edit'
		end
	end


	def destroy
		@school = School.find(params[:id]).destroy
		redirect_to schools_path, notice: "School deleted."
	end


	def generate
		@total_pupils = rand(90..110)
		school = School.find(params[:id])		
		
		@total_pupils.times do
			School.generate_pupil_for school
		end

		redirect_to school_path, notice: "#{@total_pupils} students generated!"		
	end


	private
	def school_params
		params.require(:school).permit(:title, :number_of_classrooms, :number_of_pupils)
	end

	def record_not_found
		render file: 'public/404'
  	end

end
