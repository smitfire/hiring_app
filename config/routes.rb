Rails.application.routes.draw do

  # API Routes
  namespace :api do
    resources :users, only: [:index, :show]
    resources :jobs, only: [:index, :show]
    resources :companies, only: [:index, :show]
  end
end
