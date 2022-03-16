Rails.application.routes.draw do
  get 'welcome/index'
  get 'answers', to: 'answers#index'
  get 'questions', to: 'questions#index'
  get 'text_answers', to: 'text_answers#index'
  get 'text_questions', to: 'text_questions#index'
  get 'quizes', to: 'quizes#index'
  get 'users', to: 'users#index'
  root 'welcome#index'
  devise_for :users

end
