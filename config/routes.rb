Rails.application.routes.draw do

  resources :answers
  resources :qs
  get 'admin/index'
  post 'admin/index'

  # authenticated :student do
  #   student = Student.find_by(studentid: params[:id])
  #   professor = Professor.find_by(name: params[:id])
  #   if student
  #     root 'students#show'
  #   elsif professor
  #     root 'professors#show'
  #   end
  # end

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
  resources :responses
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
