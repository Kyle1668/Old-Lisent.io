Rails.application.routes.draw do

  root 'abouts#index'

  namespace :api do
    resources :analyses
  end

  # root :welcomes

  # resources :analyses
end
