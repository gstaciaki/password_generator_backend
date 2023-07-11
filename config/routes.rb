Rails.application.routes.draw do
  
  get '/users', to: 'user#all' 
  post '/users', to: 'user#new'
end
