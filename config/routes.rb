Bookfinder::Application.routes.draw do
	resources :courses do
		collection do
			get :search
			get :match
		end
	end
	resources :books
	resources :shelves
	post '/students/sign-in', to: 'main#signIn'
	get '/student', to: 'main#student'
	root 'main#index'
end
