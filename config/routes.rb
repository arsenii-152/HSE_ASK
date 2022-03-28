Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      # get 'posts/:id/comments', to: 'comments#index', as: 'post_comments'
      # post 'posts/:id/comments/create', to: 'comments#create', as: 'create_post_comment'
      # put 'comments/:id', to: 'comments#update', as: 'update_post_comment'
    end
  end

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
