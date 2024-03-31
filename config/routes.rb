Rails.application.routes.draw do
  devise_for :people
  resources :placements
  resources :enrollments
  resources :grades
  resources :classrooms
  resources :people
  resources :exams
  resources :courses
  resources :semesters
  resources :localities, only: [:index]
  resources :roles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "people#index"

  # Redirect authenticated users to people#index
  authenticated :person do
    root to: "people#index", as: :authenticated_root
  end

  # Redirect unauthenticated users to people#new
  unauthenticated :person do
    root "people#new", as: :unauthenticated_root
  end

end
