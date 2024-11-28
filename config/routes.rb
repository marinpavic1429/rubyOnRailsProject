Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/users', to: redirect('/users/sign_up')

  resources :transfers
  #get 'home/index'
  get 'home/about'
  #root 'home#index'
  root 'transfers#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
