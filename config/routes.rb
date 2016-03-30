Rails.application.routes.draw do

  root to: "home#index"

  get '/' => 'home#index'
  get '/contact' => 'users#contact'
  get '/about-me' => 'users#about_me'

  devise_scope :user do
  	get "/login" => "users/sessions#new"
  	post 'login' => 'users/sessions#create'
  	delete "/logout" => "users/sessions#destroy"
  end

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations'
    }
  end

  resources :users
  resources :attachments
  resources :projects
  resources :admin
end
