Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	devise_for :users

	# resources :users do
	# 	resources :cardlists do
	# 		resources :cards
	# 		patch 'cards/:id/check' => 'cards#update2' , as: 'update2'
	# 	end
	# end

    get 'cardlists/:user_id/index' => 'cardlists#index' , as: 'cardlists_index'
    post 'cardlists/:user_id' => 'cardlists#create'
    get 'cardlists/index_all_users' => 'cardlists#index_all_users', as: 'cardlists_index_all_users'

	resources :users
	resources :cardlists do
		resource :favorites, only: [:create, :destroy]
		resources :cards
		patch 'cards/:id/check' => 'cards#update2' , as: 'update2'
	end

	root :to => 'root#top'
end
