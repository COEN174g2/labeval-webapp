Rails.application.routes.draw do

  resources :answers
  resources :qs
  get 'admin/index'
  post 'admin/index'
  get 'admin/upload'
  get 'admin/email'

  root 'landing#index'
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    get 'profile' => :profile
  end
  
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  get 'landing/index'

  resources :questionnaires
  resources :professors
  resources :students do
    resources :responses
  end
  #resources :responses
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
