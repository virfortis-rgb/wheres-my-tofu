Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/new'
  get 'scans/show'
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists, only: [:index, :new, :create, :show, :destroy] do
    member do
      patch :favorite_stores
    end

    resources :items, only: [:show, :update, :destroy] do
      collection do
        post :attach
      end
    end
  end

  resources :scans, only: [:new, :show, :create, :destroy]
  resources :prices, only: [:update, :destroy]
end
