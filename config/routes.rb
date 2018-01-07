Rails.application.routes.draw do

  resources :welcomes
  namespace :api do
    resources :analyses
  end

  # root :welcomes

  # resources :analyses
end
