Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]
  
  namespace :instructor do
    resources :sections, only: [] do
      resources :lessons, only: [:new, :create]
    end
    # We can get the course_id into the URL if we hook the new and create actions by 
    # nesting the sections underneath the course resource.
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end 
end
