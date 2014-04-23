class MainController < ApplicationController
	skip_before_action :require_sign_in, only: [:index, :signIn]
	before_action :is_admin, only: [:admin]
	def index
	
	end

	def signIn
		student = Student.where(user_id: params[:user_id])
		if student.length != 0 && student.first.password == params[:password]
			session[:std_id] = student.first.id
			session[:std_user_id] = student.first.user_id
			if session[:std_user_id] == "admin"
				redirect_to '/admin'
			else	
				redirect_to "/student"
			end
		else
			flash[:message] = "Incorrect ID/Password"
			render "index"
		end
	end

	def admin

	end

	def student
		@student = Student.find(session[:std_id])
	end

	private

		def is_admin
			if session[:std_user_id] != "admin"
				flash[:error] = "You must be admin"
				render "main/index" # halts request cycle
			end
		end
end
