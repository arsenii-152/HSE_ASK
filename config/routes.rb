Rails.application.routes.draw do

  resources :quizzes do
    resources :questions do
      resources :answers
    end
  end


  get 'answers', to: 'answers#index'
  get 'questions', to: 'questions#index'
  get 'quizzes', to: 'quizzes#index'
  get 'users', to: 'users#index'
  devise_for :users

end
