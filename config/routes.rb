Rails.application.routes.draw do
  root 'pages#home'
  

  get '/' => "pages#home", as: :home
  get 'pages/help' => "pages#help", as: :help
  get 'pages/contact' => "pages#contact", as: :contact
  get 'pages/about' => "pages#about", as: :about
  get '/new' => "users#new", as: :new
  get '/signup' => "users#new"
  get '/signin' => "sessions#new"
  post '/signin' =>"sessions#create"
  get '/signout' => "sessions#destroy"
  
  resources :users
  resources :sessions, :only => [:new , :create, :destroy]
  
  
end
