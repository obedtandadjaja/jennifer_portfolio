Rails.application.routes.draw do

  root to: "home#index"

  get '/' => 'home#index'
  get '/contact' => 'home#contact'
  get '/about-me' => 'home#about_me'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      confirmations: 'users/confirmations'
    }
  end

  devise_scope :user do
    get "/login" => "users/sessions#new"
    get "/logout" => "users/sessions#destroy"
    post 'login' => 'users/sessions#create'
    delete "/logout" => "users/sessions#destroy"
  end

  resources :users
  resources :attachments
  resources :projects
  resources :admin
end
