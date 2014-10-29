Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :recipes do
    resources :products_recipes, only: [:index, :new, :create, :destroy]
  end
  resources :integrations
  resources :trello_integration, only: :create do
    collection do
      get :boards
      post :lists
    end
  end
  resources :units

  root 'products#index'

  devise_for :users
  devise_scope :user do
    get "/auth/:provider/callback" => "authentications#create"
  end
  match "/signout" => "authentications#destroy", :as => :signout, :via => [:get, :post]
end
