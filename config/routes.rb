Rails.application.routes.draw do
  get '/welcome/:first_name', to: 'welcome#show'
  get '/team', to: 'static#index'
  get '/contact', to: 'static#contact'
  get '/accueil', to: 'gossips#index'
  # get 'gossips/display'
  get '/city', to:'gossips#location'
  # get '/gossips/:id', to: 'gossip#individual'
  # get '/gossips/:id/edit', to: 'gossip#edit'
  resources :gossips do
    resources :likes 
  end 
  get '/author/:id', to: 'gossip#author'
  # get '/sessions', to: 'sessions#profile'
  delete '/sessions', to: 'sessions#destroy'
  # get '/sessions/signin', to: 'sessions#new'
  resources :sessions, only: [:new, :create]
  resources :users
  # get '/login', to:'users#create'
  get '/welcome', to: 'welcome#show'
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html