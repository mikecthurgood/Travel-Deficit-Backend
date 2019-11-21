Rails.application.routes.draw do
  get 'countries/add'
  get '/countries', to: 'countries#index'
  get '/countries/:id', to: 'countries#show'

  post '/login', to: 'users#login'
  get '/validate', to: 'users#validate'
end
