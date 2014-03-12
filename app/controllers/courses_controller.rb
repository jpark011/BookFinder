class CoursesController < ApplicationController
	# Select all courses from database and store into courses
	def index
			@courses = Course.all
	end

	# Select matching course with :id and store into course
	def show
		@course = Course.find(params[:id])
	end

	# Search for a course that user has typed
	def search
		params_array = params[:course_name].split(' ')
		course = Course.where(	subject: params_array[0], 
														number: params_array[1], 
														section: params_array[3]).first
		redirect_to course_path(course)
	end

	def match 
		@courses = Course.select("subject, number, section").map { 
			|x| x.subject + ' ' + x.number + ' Section ' + x.section
		}
		render :json => @courses
	end
end
