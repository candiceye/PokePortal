Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers, :pokemons
  patch '/capture', to: 'pokemons#capture'
  delete '/damage', to: 'pokemons#damage'
  get '/new', to: 'pokemons#new'
  post '/create', to: 'pokemons#create'
end
