Rails.application.routes.draw do
  get 'pages/home', to:'pages#home', as: 'home'
  get 'pages/addfriend', to:'pages#addfriend'
  get 'posts/search_by_category', to:'pages#home'
  get 'chats/index', to:'chats#index'
  get 'postchats/index', to:'postchats#index'
  get 'messages/index', to:'messages#index'
  get 'postmessages/index', to:'postmessages#index'
  post 'interests/create', to: 'interests#create'
  resources :messages,only: [:new,:create]
  resources :postmessages,only: [:new,:create]
  devise_for :users , :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :friendships , :posts,:interests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
