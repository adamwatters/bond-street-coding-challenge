Rails.application.routes.draw do
  root 'main#home'
  get  '/signup', to: 'users#new'
  post  '/signup', to: 'users#create'
end
