Rails.application.routes.draw do

  resources :users, :orders, :products, :wishlists, :sessions
  root 'static_pages#home'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
