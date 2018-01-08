Rails.application.routes.draw do

  root 'abouts#index'
  get '/compute', to: 'api/analyses#index'
  # get '/api', to: 'api/analyses#index'

  # namespace :api do
  #   resources :analyses
  # end

  # root :welcomes

  # resources :analyses
end
