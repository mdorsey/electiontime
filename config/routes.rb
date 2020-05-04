Rails.application.routes.draw do
 
  # Static_Pages controller  
  root    'static_pages#home'
  get     '/about', to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'
  get     '/volunteer', to: 'static_pages#volunteer'

  # Comparison_Pages controller  
  get     '/find-my-election', to: 'comparison_pages#find_my_election'

  # Sessions controller
  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'

  # Admin controller
  get     'admin/dashboard'
  
  resources :account_activations, only: [:edit]
  resources :addresses
  resources :content_locations
  resources :contents
  resources :districts
  resources :election_types
  resources :elections
  resources :jurisdictions
  resources :languages
  resources :log_types
  resources :logs
  resources :participants
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :parties
  resources :profiles, only: [:index, :edit, :show, :update]
  resources :provinces
  resources :social_media_profiles
  resources :social_media_types
  resources :survey_answers
  resources :survey_questions
  resources :survey_types
  resources :surveys
  resources :system_settings
  resources :user_types
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
