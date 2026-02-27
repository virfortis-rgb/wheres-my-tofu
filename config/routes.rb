Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/new'
  get 'lists/show'
  get 'scans/new'
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists, only: [:index, :new, :create, :show, :destroy] do
    resources :items, only: [:show, :update, :destroy] do
      # Change create to attach since I think it’s more intuitive to say “attach an exist item in our database to a list”
      # rather than “create an new item in a list” when we’re just linking an existing item to the list.
      collection do
        post :attach
      end
    end
  end

  resources :scans, only: [:new, :show, :create]
end
