
# require 'sidekiq/web'

# class AdminConstraint 
#   def matches?(request)
#     user_id = request.session[:user_id] || request.cookie_jar.encrypted[:user_id]
#   end
# end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resource :session, only: %i[new create destroy]
  resource :reset_password, only: %i[new create edit update]

  resources :users, only: %i[new create edit update]

  resources :questions do
    resources :commentquestions
    resources :answers, except: %i[new show]
  end

  resources :answers, except: %i[new show] do
    resources :commentanswers, only: %i[create destroy]
  end

   namespace :admin do 
      resources :users, only: %i[index create edit update destroy]
  end

  root "pages#index"
end
