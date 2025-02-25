Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for "User", at: "auth"
    resources :products, only: [ :index ]
    post "carts/add_product", to: "carts#add_product"
  end
end
