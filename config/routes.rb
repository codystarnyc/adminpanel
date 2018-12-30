Rails.application.routes.draw do
  resources :course_registrations
  resources :students
  resources :courses
  resources :instructors
  resources :cohorts
  root to: 'pages#home'

  

  root 'dashboard#index'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  get 'dashboard/index'
  get 'dashboard/home'


  # resources :instructors do
  #     member do
  #         get :delete
  #     end
  # end

  # resources :students do
  #     member do
  #         get :delete
  #     end
  # end

  # resources :courses do
  #     member do
  #         get :delete
  #     end
  # end

  # resources :course_registrations do
  #     member do
  #         get :delete
  #     end
  # end

  # resources :cohorts do
  #     member do
  #         get :delete
  #     end
  # end



  get "students/new" => 'students#new', :as => :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end