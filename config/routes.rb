Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :questions do
    resources :commentquestions
    resources :answers, except: %i[new show]
  end

  resources :answers, except: %i[new show] do
    resources :commentanswers, only: %i[create destroy]
  end

  resources :users, only: %i[new create edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
