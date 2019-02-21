Rails.application.routes.draw do
  root 'pages#home'

  get '/' => "pages#home", as: :home
  get 'pages/help' => "pages#help", as: :help
  get 'pages/contact' => "pages#contact", as: :contact
  get 'pages/about' => "pages#about", as: :about
  get 'users/new' => "users#new", as: :new
  
  
end
