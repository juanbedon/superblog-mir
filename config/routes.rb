Rails.application.routes.draw do

  devise_for :users
	root to: 'blog/posts#index'

	namespace :users do

  	resources :posts do
  		put 'publish' => 'posts#publish', on: :member
  		put 'unpublish' => 'posts#unpublish', on: :member
  	end

	end

	scope module: 'blog' do

		get 'about' => 'pages#about', as: :about
		get 'contact' => 'pages#contact', as: :contact
		get 'posts' => 'posts#index', as: :posts
		get 'posts/:id' => 'posts#show', as: :post

	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
