Rails.application.routes.draw do
  resources :orders, only: [:index, :show, :new, :create]
  resources :baskets, only: [:show, :create, :destroy]
  devise_for :customers
  # Resource paths
  resources :games, only: [:index, :show] do
    resources :line_items, only: [:create, :destroy]
  end
  get 'search', to: 'games#search', as: 'search'
  get 'nintendo_switch_games', to: 'games#nintendo_switch_games', as: 'nintendo_switch_games'
  get 'ps5_games', to: 'games#ps5_games', as: 'ps5_games'
  get 'xbox_series_x_games', to: 'games#xbox_series_x_games', as: 'xbox_series_x_games'
  # Home page is the root.
  root 'home#home'
  # Contact page.
  get 'contact', to: 'home#contact'
  # The post route for the contact form.
  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
