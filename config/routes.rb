Rails.application.routes.draw do
  
  # Static_Pages controller  
  root    'static_pages#home'
  get     '/about',   to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'

  # Sessions controller
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :candidates

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
