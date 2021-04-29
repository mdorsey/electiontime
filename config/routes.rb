Rails.application.routes.draw do
 
  # Static_Pages controller  
  root    'static_pages#home'
  get     '/about', to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'

  # Sessions controller
  get     '/login', to: 'sessions#new'
  post    '/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'

  # Admin controller
  get     '/admin/dashboard', to: 'admin#dashboard'
  get     '/admin/import-districts', to: 'admin#import_districts'
  post    '/admin/import-districts', to: 'admin#import_districts_submit'
  get     '/admin/import-participants', to: 'admin#import_participants'
  post    '/admin/import-participants', to: 'admin#import_participants_submit'
  
  resources :account_activations, only: [:edit]
  resources :content_locations
  resources :contents
  resources :districts
  resources :election_types
  resources :elections
  resources :jurisdictions
  resources :languages
  resources :log_types
  resources :logs
  resources :offices
  resources :participants
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :parties
  resources :profiles, only: [:index, :edit, :show, :update]
  resources :social_media_profiles
  resources :social_media_types
  resources :survey_answers
  resources :survey_questions
  resources :survey_types
  resources :surveys
  resources :system_settings
  resources :user_types
  resources :users

  # Users controller
  get     '/send-welcome-email/:id', to: 'users#send_welcome_email', as: 'send_welcome_email'

  # Comparison_Pages controller  
  # These routes MUST be last in the list
  get     '/find-my-election', to: 'comparison_pages#find_my_election'
  get     '/:election_slug', to: 'comparison_pages#election_summary', as: 'election_summary'
  get     '/:election_slug/candidates/:office_id', to: 'comparison_pages#compare_candidates', as: 'compare_candidates'
  get     '/:election_slug/candidates/:office_id/:district_id', to: 'comparison_pages#compare_candidates_in_district', as: 'compare_candidates_in_district'
  get     '/:election_slug/leaders', to: 'comparison_pages#compare_party_leaders', as: 'compare_party_leaders'
  get     '/:election_slug/parties', to: 'comparison_pages#compare_party_platforms', as: 'compare_party_platforms'

end
