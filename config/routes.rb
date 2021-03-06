Rails.application.routes.draw do

  devise_for :users
	root to: 'blog/posts#index'

	namespace :users do

		get '/account' => 'accounts#edit', as: :account
		put '/info' => 'accounts#update_info', as: :info
		put '/change_password' => 'accounts#change_password', as: :change_password

  	resources :posts do
  		put 'publish' => 'posts#publish', on: :member
  		put 'unpublish' => 'posts#unpublish', on: :member
  	end

	end

	scope module: 'blog' do

		get 'posts' => 'posts#index', as: :posts
		get 'posts/:id' => 'posts#show', as: :post

	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
