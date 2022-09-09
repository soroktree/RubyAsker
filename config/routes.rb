Rails.application.routes.draw do
  resources :questions do
    resources :answers, except: %i[new show]
  end

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
