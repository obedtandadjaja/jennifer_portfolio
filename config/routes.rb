Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  get '/contact' => 'users#contact'
  get '/about-me' => 'users#about_me'

  resources :users
  resources :attachments
  resources :projects
end
