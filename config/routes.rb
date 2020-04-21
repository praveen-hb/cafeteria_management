Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  post "/menu_items/cart" => "menu_items#cart"
  get "/menu_items/cart_items" => "menu_items#cart_items"
  resources :menu_items
  resources :orders
  resources :order_items
  resources :menus
  resources :users
  get "/admin/report" => "admin#reports", as: :reports
  post "/admin/invoices" => "admin#invoices", as: :invoices
  get "/myorders" => "menu_items#myorders", as: :my_orders
  get "/admin" => "admin#index", as: :admin_page
  get "/clerk" => "admin#clerk", as: :clerk_page
  post "/admin" => "users#adding_user", as: :users_add_user
  get "/admin/add_user" => "users#adding_user_page", as: :users_add_user_page
  get "/admin/users_info" => "users#info", as: :users_info
  post "/menus/:id/update" => "menus#updation"
  post "/menu_items/:id/update" => "menu_items#updation"
  post "/orders/display" => "orders#display"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
