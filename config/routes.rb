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

  get "/admin" => "admin#index", as: :admin_page
  get "/users_info" => "users#info", as: :users_info
  #get "/addmenu" => "menus#add_menu", as: :add_menu
  #get "/listofmenus" => "menus#list_of_menus", as: :list_of_menus
  #get "/changeStandardmenu" => "menus#change_standard_menu", as: :change_of_standard_menu
  post "/menus/:id/update" => "menus#updation"
  post "/menu_items/:id/update" => "menu_items#updation"
  post "/orders/display" => "orders#display"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
