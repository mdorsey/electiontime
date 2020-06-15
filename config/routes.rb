Rails.application.routes.draw do
 
  # Static_Pages controller  
  root    'static_pages#home'
  get     '/about', to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'
  get     '/volunteer', to: 'static_pages#volunteer'

  # Comparison_Pages controller  
  get     '/find-my-election', to: 'comparison_pages#find_my_election'
  get     '/find-my-election/:election_id', to: 'comparison_pages#election_summary', as: 'election_summary'
  get     '/find-my-election/:election_id/compare-candidates/:district_id', to: 'comparison_pages#compare_candidates', as: 'compare_candidates'
  get     '/find-my-election/:election_id/compare-party-leaders', to: 'comparison_pages#compare_party_leaders', as: 'compare_party_leaders'
  get     '/find-my-election/:election_id/compare-party-platforms', to: 'comparison_pages#compare_party_platforms', as: 'compare_party_platforms'

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
