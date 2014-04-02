Bookfinder::Application.routes.draw do
	resources :courses do
		collection do
			get :search
			get :match
		end
	end
	resources :books
	root 'courses#index'
end
