Rails.application.routes.draw do
  # resources :categories
  # resources :sizes
  # resources :images
  # resources :colors
  # resources :products
  # resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      post 'signup', to: 'customers#create'
      post 'login', to: 'customers#login'
      # devise_for :customers
      resources :categories, only: [:index, :show] do
        resources :products, only: [:index, :show]
      end
      
      resources :products, only: [] do
        resources :colors, only: [:index, :show]
        resources :images, only: [:index, :show]
        resources :sizes, only: [:index, :show]
      end
      
      resources :customers
      
      resources :customers_products, only: [:index, :show]
    end
  end
end
