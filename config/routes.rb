Rails.application.routes.draw do
  get '/users/new', to: 'users#new', as:'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
end
