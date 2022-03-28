Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'quizzes/:id/long_text_questions', to: 'long_text_questions#index'
      get 'quizzes/:id/short_text_questions', to: 'short_text_questions#index'
      get 'quizzes/:id/single_choice_questions', to: 'single_choice_questions#index'
      get 'quizzes/:id/multiple_choice_questions', to: 'multiple_choice_questions#index'
      # post 'posts/:id/comments/create', to: 'comments#create', as: 'create_post_comment'
      # put 'comments/:id', to: 'comments#update', as: 'update_post_comment'
    end
  end

  resources :quizzes do
    resources :questions
    resources :long_text_questions 

  end



  get 'answers', to: 'answers#index'
  get 'questions', to: 'questions#index'
  get 'quizzes', to: 'quizzes#index'
  get 'users', to: 'users#index'
  devise_for :users

end
