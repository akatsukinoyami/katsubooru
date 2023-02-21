Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :entities
    resources :collections
    resources :users, except: %i[create]
    resources :tags,  only: %i[index show create update]

    get  '/tags',         to: 'tags#all'
    post '/auth/sign_in', to: 'authentication#sign_in'
    post '/auth/sign_up', to: 'authentication#sign_up'
  end

  mount Rswag::Ui::Engine => '/api'
  mount Rswag::Api::Engine => '/api'

  match "*path", to: "application#fallback_index_html", via: :all
end
