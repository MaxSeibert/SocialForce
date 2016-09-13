Rails.application.routes.draw do
  #root to this side to instant login. (will be changed later)
  root 'users#new'
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  
  resources :users
  get 'page/index'
  root 'page#index'
  
  resources :profiles, only: [:new, :create, :destroy]
  get 'newprofile', to: 'profiles#new', as: 'newprofile'
  #get 'destroyProfile', to: 'profiles#destoy', as: 'destroyProfile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
