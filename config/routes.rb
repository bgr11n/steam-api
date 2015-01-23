Rails.application.routes.draw do

  resources :store, only: ['index', 'create']

  root 'app#index'

  post 'auth/steam/callback', to: 'app#auth_callback'

  get 'app/log_out', to: 'app#log_out', as: 'log_out'

  get '/inventory', to: 'inventory#show', as: 'inventory'

  get '/load_inventory', to: 'inventory#load'

end
