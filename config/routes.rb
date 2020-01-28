Rails.application.routes.draw do
  get 'pages/home', to:'pages#home', as: 'home'
  get 'pages/addfriend', to:'pages#addfriend'
  devise_for :users , :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  resources :friendships
 
 resources :posts do
   collection do
     get 'hobby'
     get 'study'
     get 'team'
   end
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
