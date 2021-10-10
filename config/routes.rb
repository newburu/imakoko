Rails.application.routes.draw do
  resources :locations do
    collection do
      get 'search'
    end
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
  root "users#index"
end
