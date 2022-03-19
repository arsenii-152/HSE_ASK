Rails.application.routes.draw do
  resources :quizzes
  get 'answers', to: 'answers#index'
  get 'questions', to: 'questions#index'
  get 'text_answers', to: 'text_answers#index'
  get 'text_questions', to: 'text_questions#index'
  get 'quizzes', to: 'quizzes#index'
  get 'users', to: 'users#index'
  root 'quizzes#index'
  devise_for :users

end
