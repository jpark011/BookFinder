class MainController < ApplicationController

	def index
	
	end

	def signIn
		student = Student.where(user_id: params[:user_id])
		if student.length != 0 && student.first.password == params[:password]
			session[:std_id] = student.first.id
			redirect_to "/student"
		else
			flash[:message] = "Incorrect ID/Password"
			render "index"
		end
	end

	def student
		@student = Student.find(session[:std_id])
	end
end
