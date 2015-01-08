Rails.application.routes.draw do
  root 'app#index'
  post 'auth/steam/callback', to: 'app#auth_callback'
  get 'app/log_out', to: 'app#log_out', as: 'log_out'
  get '/inventory', to: 'inventory#show', as: 'inventory'
end
