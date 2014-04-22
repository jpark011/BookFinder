class ShelvesController < ApplicationController
	before_filter :is_admin, only: [:new, :create, :edit, :update, :destroy]
	
	def index
	end

	def show
	end

	def new
	end

	def create
	end

	def edit

	end

	def update

	end

	def destory

	end

	private
		def shelf_params
			params.require(:shelf).permit(:floor, :subject, :section, :shelf_number, :x, :y)
		end

		def is_admin
			if session[:std_user_id] != "admin"
				flash[:error] = "You must be admin"
				render "main/index" # halts request cycle
			end
		end

end
