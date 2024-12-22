Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root "users#index" # Admin start page
    resources :users
    resources :quests, :teachers, :parents, controller: :users
    resources :meetings do
      member do
        get :show_modal
      end
    end  
    resources :meeting_types
  end

  namespace :parent do
    root "parent_meetings#index" # Parent start page
    resources :parent_meetings
    resources :meetings
  end

  resources :meeting_hours

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # # Render dynamic PWA files from app/views/pwa/*
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home_page#index"
end
