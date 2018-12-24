Rails.application.routes.draw do
  resources :course_registrations
  resources :students
  resources :courses
  resources :instructors
  resources :cohorts
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end