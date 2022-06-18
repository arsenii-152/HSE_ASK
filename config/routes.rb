Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :quizzes
    end
  end



  resources :quizzes do
    resources :multiple_choice_questions do
      resources :question_options do
        resources :answer_options
      end
    end
    resources :single_choice_questions do
      resources :question_options do
        resources :answer_options
      end
    end
    resources :long_text_questions do
      resources :answers
    end
    resources :short_text_questions do
      resources :answers
    end
  end

  get '/multiple_choice_questions/create', to: 'quizzes#new', as: 'multiple_choice_question'

  root to: 'quizzes#index'

  devise_for :users

end
