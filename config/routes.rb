Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'healthcheck' see middleware_healthcheck.rb

  get 'info', to: 'diagnostics#info'

  post 'utilization', to: 'censuses#utilization'

  resources :providers, only: [:index, :show]
  resources :shelters, only: [:show, :index] do
    resources :buildings, controller: 'shelter_buildings', only: [:show]
  end
  resources :shelter_buildings, only: :index
end
