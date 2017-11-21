Rails.application.routes.draw do
	
  # rooting
  root 'api/v1/conversations#index'

  namespace :api do
    namespace :v1 do
		resources :conversations, only: [:index, :create] do
	  		resources :messages, only: [:index, :create]
		end
    end
  end
end
