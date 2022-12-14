Rails.application.routes.draw do
  
  devise_for :users
  
  root to: 'home#top'
  get 'home/about'
  
  resources :books, except: :new
  resources :users, only: [:index, :show, :edit, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
