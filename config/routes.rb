Rails.application.routes.draw do
  get 'answers', to: 'answers#index'
  get 'questions', to: 'questions#index'
  get 'quizes', to: 'quizes#index'
  get 'users', to: 'users#index'
  devise_for :users

end
