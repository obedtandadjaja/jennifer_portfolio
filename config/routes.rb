Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  get '/contact' => 'users#contact'
  get '/about-me' => 'users#about_me'
  
  devise_scope :user do
  	get "/login" => "devise/sessions#new"
  	post 'login' => 'devise/sessions#create'
  	delete "/logout" => "devise/sessions#destroy"
  end

  resources :users
  resources :attachments
  resources :projects
end
