Rails.application.routes.draw do
  resources :games
  # Home page is the root.
  root 'home#home'
  # Contact page.
  get 'contact', to: 'home#contact'
  # The post route for the contact form.
  post 'request_contact', to: 'home#request_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
