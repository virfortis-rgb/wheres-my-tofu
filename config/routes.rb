Rails.application.routes.draw do
  get 'lists/index'

  get 'lists/new'
  get 'lists/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists, only: [:index, :new, :create, :show, :destroy] do
    resources :items,only: [:show, :update, :destroy] do
      # Change create to attach since I think it’s more intuitive to say “attach an exist item in our database to a list”
      # rather than “create an new item in a list” when we’re just linking an existing item to the list.
      collection do
        post :attach
      end
    end
  end
end
