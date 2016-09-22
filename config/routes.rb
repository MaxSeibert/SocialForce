Rails.application.routes.draw do
 

 



  

  


  




  #root to this side to instant login. (will be changed later)
  root 'about#index'
  
  get 'about', to: 'about#index', as: 'about'
  get 'team', to: 'team#index', as: 'team'
  get 'contact', to: 'contact#index', as: 'contact'
  get 'tos', to: 'terms_of_service#index', as: 'tos'
  get 'adminarea', to: 'admin_area#show', as: 'adminarea'
  
  get 'volunteers', to: 'volunteers#index', as: 'volunteers'
  get 'gifting', to: 'gifting#index', as: 'gifting'
  get 'programs', to: 'programs#index', as: 'programs'
  
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  
  resources :users
  resources :profiles
  get 'findmatch', to: 'organisations#find_matching_organisation', as: 'findmatch'
  
  
  resources :organisations  
  
  resources :matches
  get "/details" => "organisations#details"
  
  
  resources :contact, only: [:index, :new, :create]
  post "/contact" => "contact#create", :as => :create_contact
  
  #post 'profiles/new'
  #get 'newprofile', to: 'profiles#new', as: 'newprofile'
  #get 'profiles/:id', to: 'profiles#show', as: 'showprofile'
  #get 'destroyProfile', to: 'profiles#destoy', as: 'destroyProfile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
