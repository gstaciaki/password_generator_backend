Rails.application.routes.draw do
  
  get '/users', to: 'user#all' 
  post '/users', to: 'user#new'
  get '/users/:hash_id', to: 'user#show', as: :user
  patch '/users/:hash_id', to: 'user#update'
  delete '/users/:hash_id', to: 'user#destroy'
end
