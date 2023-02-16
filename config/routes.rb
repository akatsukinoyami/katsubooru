Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    resources :entities
    resources :collections
    resources :users, except: %i[create]
    namespace :tags do
      resources :artists,    only: %i[index create update]
      resources :titles,     only: %i[index create update]
      resources :characters, only: %i[index create update]
      resources :tags,       only: %i[index create update]
    end

    get  '/tags',         to: 'tags#all'
    post '/auth/sign_in', to: 'authentication#sign_in'
    post '/auth/sign_up', to: 'authentication#sign_up'
  end

  mount Rswag::Ui::Engine => '/api'
  mount Rswag::Api::Engine => '/api'

  match "*path", to: "application#fallback_index_html", via: :all
end
