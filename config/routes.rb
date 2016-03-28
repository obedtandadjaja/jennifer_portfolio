Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  get '/contact' => 'user#contact'
  get '/about-me' => 'user#about_me'

  resources :users
  resources :attachments
  resources :projects
end
