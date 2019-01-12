Rails.application.routes.draw do
  get 'users/show/:id' => 'users#show'
  get 'users/edit/:id' => 'users#edit'
  get 'users/index' => 'users#index'
  get 'cohorts/show/:id' => 'cohorts#show'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy' 
    get '/users/edit/:id' => 'devise/sessions#edit'
    get '/users/show/:id' => 'devise/sessions#show'
end

  resources :instructors do
    member do
        get :delete
    end
end

resources :students do
    member do
        get :delete
    end
end

resources :courses do
    member do
        get :delete
    end
end

resources :course_registrations do
    member do
        get :delete
    end
end

resources :cohorts do
    member do
        get :delete
    end
end

  root to: 'pages#home'
  get 'dashboard/index' 
  get 'dashboard/home'
  get 'students/new' => 'students#new', :as => :new


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
