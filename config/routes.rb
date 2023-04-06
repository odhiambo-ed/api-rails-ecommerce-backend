Rails.application.routes.draw do
  # resources :categories
  resources :sizes
  resources :images
  resources :colors
  resources :products
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :categories do
    resources :products, only: [:create, :destroy]
  end
end
