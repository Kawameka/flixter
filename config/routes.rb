Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :courses, only: [:index, :show]
  namespace :instructor do
    # We can get the course_id into the URL if we hook the new and create actions by 
    # nesting the sections underneath the course resource.
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end
  
end
