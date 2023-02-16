Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :entities
    resources :tags
    resources :users, except: %i[create]

    post '/auth/sign_in', to: 'authentication#sign_in'
    post '/auth/sign_up', to: 'authentication#sign_up'
  end
end
