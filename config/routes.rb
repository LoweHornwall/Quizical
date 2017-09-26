Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'quizzes/new' => 'quiz#new'
  post 'quizzes' => 'quiz#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end