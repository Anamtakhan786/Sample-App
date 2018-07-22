Rails.application.routes.draw do
  get 'contacts/create'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
	resources :users do
    member do
      get :following , :followers
    end 
  end
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  #get  '/contact', to: 'static_pages#contact'
  get '/contact', to: 'contacts#new' , as:'new_contact'
  post '/contact', to: 'contacts#create' , as:'create_contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :account_activations, only: [:edit]
  resources :password_resets , only: [:new , :create, :edit , :update]
  resources :microposts, only: [:create, :destroy] do
    resources :comments, :only => [:create, :destroy]
  end
  resources :relationships , only: [:create , :destroy]
  resources :user_comment , only:[:create]
end