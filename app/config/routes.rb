Rails.application.routes.draw do
  root 'main#home'
  get  '/signup', to: 'users#new'
  post  '/signup', to: 'users#create'
  get  '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/step/:position', to: 'steps#show', as: 'step'
  patch '/step/:position', to: 'steps#update'
end
