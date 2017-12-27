Rails.application.routes.draw do

  namespace :api do
    resources :analyses
  end

  resources :analyses
end
