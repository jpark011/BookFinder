class BooksController < ApplicationController
	before_filter :is_admin, only: [:new, :create, :edit, :update, :destroy]
	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end

	def create
		if Book.create!(book_params)
			flash[:success] = "Book created"
      redirect_to @book
		else
      render 'new'
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end
	
	def update
		@book = Book.find(params[:id])
		if @book.update_attributes(book_params)
			flash[:success] = "Book updated"
      redirect_to @book
    else
      render 'edit'
    end
	end

	def destroy
		Book.find(params[:id]).delete
		redirect_to books_url
	end

	private
		def book_params
      params.require(:book).permit(:title, :author, :publisher,
                                   :edition, :price, :required, :shelf_id)
    end

		def is_admin
			if session[:std_user_id] != "admin"
				flash[:error] = "You must be admin"
				render "main/index" # halts request cycle
			end
		end
end
