Rails.application.routes.draw do
  
  get '/countries', to: 'countries#index'
  get '/countries-and-info', to: 'countries#info'
  get '/countries/:id', to: 'countries#show'
  post '/countries', to: 'countries#create'
  # patch '/countries/:id', to: 'countries#update'
  post '/login', to: 'users#login'
  get '/validate', to: 'users#validate'
  post '/add-user-country', to: 'users#add_user_country'

end
