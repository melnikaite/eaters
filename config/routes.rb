Rails.application.routes.draw do
  resources :recipes
  resources :products
  resources :categories
  resources :units
  resources :trello_integration, only: :create do
    collection do
      get :boards
      post :lists
    end
  end

  root 'products#index'

  devise_for :users
  devise_scope :user do
    get "/auth/:provider/callback" => "authentications#create"
  end
  match "/signout" => "authentications#destroy", :as => :signout, :via => [:get, :post]
end
