class Classroom < ActiveRecord::Base

	belongs_to :school
	has_many :pupils

	accepts_nested_attributes_for :pupils

end
