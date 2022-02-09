Rails.application.routes.draw do

  #User routes
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'

  #Session routes
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy' 
end
