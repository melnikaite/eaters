Rails.application.routes.draw do
  resources :products, only: [:index, :update, :create, :destroy]
  resources :categories, only: [:index, :update, :create, :destroy]
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
  resources :shopping_lists do
    resources :shopping_list_items, except: :show
  end
  resources :units, only: :index

  root 'products#index'

  devise_for :users
  devise_scope :user do
    get "/auth/:provider/callback" => "authentications#create"
  end
  match "/signout" => "authentications#destroy", :as => :signout, :via => [:get, :post]
end
