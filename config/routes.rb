Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources :cards
  resources :searches, only: [:new, :show, :create]

  namespace :api do
    namespace :v1 do
      resources :cards
    end
  end
end
