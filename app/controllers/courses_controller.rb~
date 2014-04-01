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
														section: params_array[3])
		redirect_to :action => "show", :id => course.first.id
	end

	# Return matched courses
	def match 
		unless params[:term].nil?
			# JQuery UI autocomplte api
			input_array = params[:term].split(' ')
		end
		subject = (defined?(input_array[0]))? input_array[0].upcase : ""
		number = (defined?(input_array[1]))? input_array[1] : ""
		section = (defined?(input_array[3]))? input_array[3] : ""

		courses = Course.limit(6).where("subject LIKE ? AND number LIKE ? AND section LIKE ?", "#{subject}%", "#{number}%", "#{section}%").order(:subject, :number, :section)
		courses = courses.map { 
			|x| x.subject + ' ' + x.number + ' Section ' + x.section
		}
		render :json => courses
	end
end
