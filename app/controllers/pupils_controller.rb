class PupilsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :verification
	require 'ffaker'
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found


	def index
		@school = School.find(params[:school_id])		
		@pupils = Pupil.where(:school_id => @school.id)
		$total_count = Pupil.where(:school_id => @school.id).count

		render template: 'shared/view'				
	end


	def new
		@pupil = Pupil.new		
	end


	def show
		@pupil = Pupil.find(params[:id])
		@school = School.find(params[:school_id])			
	end
	

	def create
		school = School.find(params[:school_id])
		@pupil = school.pupils.new(pupil_params) 
		if @pupil.save 
		  redirect_to action: :show, id: @pupil.id, notice: "New pupil created!"
		else 
			render 'new' 
		end
	end


	def edit
		school = School.find(params[:school_id])
		@pupil = school.pupils.find(params[:id])		
	end


	def update
		school = School.find(params[:school_id])
		@pupil = school.pupils.find(params[:id])
		if @pupil.update(pupil_params)
			redirect_to school_pupil_path, notice: "Pupil updated."
		else
			render 'edit'
		end
	end


	def destroy
		@pupil = Pupil.find(params[:id])
		@pupil.destroy
		redirect_to pupils_path, notice: "Pupil deleted."
	end


	def distribute
		@school = School.find(params[:id])
		@pupils = Pupil.where(:school_id => @school.id)

		school = School.find(params[:id])
		@pupil = school.pupils.find(params[:id])

		@male_pupils = Pupil.where(:gender => '0', :school_id => @school.id).count 
		@female_pupils = $total_count - @male_pupils

		@pupils_per_classroom = $total_count / @school.number_of_classrooms
		@malePupilsPerClassroom = ((@male_pupils.to_f/$total_count.to_f) * @pupils_per_classroom).to_i
		@femalePupilsPerClassroom = @pupils_per_classroom - @malePupilsPerClassroom

		buffer_m=0
		buffer_f=0
		i=0
		j=0
#		@pupil.update(pupil_params)
		@pupils.each do |ppl|
			if ppl.gender == 0
				ppl.classroom_id << ((i % @school.number_of_classrooms) + 1)
				buffer_m += 1
				if buffer_m == @malePupilsPerClassroom
					i+=1
				end
			elsif
				ppl.classroom_id << ((j % @school.number_of_classrooms) + 1)
				buffer_f += 1
				if buffer_f == @femalePupilsPerClassroom
					j+=1
				end
			end			
		end

		#redirect_to school_path, :notice => "Students distributed!"
	end


	private
	def pupil_params
		params.require(:pupil).permit(:name, :gender, :special, :school_id, :classroom_id)
	end

	def record_not_found
		render file: 'public/404'
	end

end
