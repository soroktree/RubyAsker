Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]

  resources :questions do
    resources :commentquestions
    resources :answers, except: %i[new show]
  end

  resources :answers, except: %i[new show] do
    resources :commentanswers, only: %i[create destroy]
  end

   namespace :admin do 
      resources :users, only: %i[index edit delete destroy update]
  end

  root "pages#index"
end
