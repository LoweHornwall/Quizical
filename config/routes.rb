Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'quizzes' => 'quiz#index'
  get 'quizzes/show/:id' => 'quiz#show', :as => 'quiz'
  get 'quizzes/new' => 'quiz#new'
  post 'quizzes' => 'quiz#create'
  get 'quizzes/play/:id'=> 'quiz#play', :as =>'play_quiz'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
