Rails.application.routes.draw do
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :users
  resources :questions do
    collection do
      get :solved
      get :unsolved
    end

    member do
      post :solve
    end
  end
end
