Rails.application.routes.draw do
  resources :products, only: [:index, :update, :create, :destroy]
  resources :categories, only: [:index, :update, :create, :destroy]
  resources :recipes, only: [:index, :update, :create, :destroy] do
    resources :products_recipes, only: [:index, :create, :destroy, :update]
  end
  resources :integrations
  resources :trello_integration, only: :create do
    collection do
      get :boards
      post :lists
    end
  end
  resources :shopping_lists, only: [:index, :update, :create, :destroy] do
    resources :shopping_list_items, only: [:index, :create, :destroy, :update]
  end
  resources :units, only: :index

  root 'products#index'

  devise_for :users
  devise_scope :user do
    get "/auth/:provider/callback" => "authentications#create"
  end
  match "/signout" => "authentications#destroy", :as => :signout, :via => [:get, :post]
end
