Bookfinder::Application.routes.draw do
	resources :courses do
		collection do
			get :search
			get :match
		end
	end
	root 'courses#index'
end
