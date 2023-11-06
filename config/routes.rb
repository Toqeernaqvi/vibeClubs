Rails.application.routes.draw do
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/admin', to: 'pages#admin', as: 'admin'
  get "/autocomplete", to: 'cities#autocomplete'
  get "/contact_us", to: 'pages#contact_us'
  get 'city_clubs/:id', to: 'cities#city_clubs'
  get 'city_clubs', to: 'cities#city_clubs_redirect'
  
  resources :suggestions
  resources :countries do
    member do 
      patch :deactivate_country
    end
  end
  
  resources :cities do 
    member do 
      patch :deactivate_city
    end
  end
  
  resources :clubs do
    resources :reviews, only: [:create]
    member do 
      patch :deactivate_club
    end
  end
  resources :features, only: [:create, :destroy]
  resources :reviews, only: [:update, :edit, :show, :destroy]
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
