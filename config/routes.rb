Rails.application.routes.draw do
  resources :quizzes do
    resources :questions
  end
  resources :questions
  get 'answers', to: 'answers#index'
  get 'questions', to: 'questions#index'
  get 'quizzes', to: 'quizzes#index'
  get 'users', to: 'users#index'
  root 'quizzes#index'
  devise_for :users

end
