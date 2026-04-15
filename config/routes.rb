Rails.application.routes.draw do
  namespace :public do
    get "addresses/index"
    get "addresses/edit"
    get "addresses/create"
    get "addresses/update"
    get "addresses/destroy"
    get "orders/new"
    get "orders/confirm"
    get "orders/thanks"
    get "orders/create"
    get "orders/index"
    get "orders/show"
    get "cart_items/index"
    get "cart_items/create"
    get "cart_items/update"
    get "cart_items/destroy"
    get "cart_items/destroy_all"
    get "customers/show"
    get "customers/edit"
    get "customers/update"
    get "customers/unsubscribe"
    get "customers/withdraw"
    get "items/index"
    get "items/show"
    get "homes/top"
    get "homes/about"
  end
  # 顧客用
  get  "/signup", to: "public/registrations#new"
  post "/signup", to: "public/registrations#create"

  scope module: :public do
    resource :session, only: [ :new, :create, :destroy ]
    resources :passwords, param: :token
  end

  # 管理者用
  namespace :admin do
    get "order_details/update"
    get "orders/show"
    get "orders/update"
    get "customers/index"
    get "customers/show"
    get "customers/edit"
    get "customers/update"
    get "genres/index"
    get "genres/create"
    get "genres/edit"
    get "genres/update"
    get "items/index"
    get "items/new"
    get "items/create"
    get "items/show"
    get "items/edit"
    get "items/update"
    resource :session, only: [:new, :create, :destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check


  

  root "public/homes#top"
  get "about" => "public/homes#about"

  # 会員登録
  get  "customers/sign_up" => "public/registrations#new"
  post "customers"         => "public/registrations#create"

  # 商品
  get "items"     => "public/items#index"
  get "items/:id" => "public/items#show", as: :item

  # マイページ・会員情報
  get   "customers/my_page"          => "public/customers#show"
  get   "customers/information/edit" => "public/customers#edit"
  patch "customers/information"      => "public/customers#update"
  get   "customers/unsubscribe"      => "public/customers#unsubscribe"
  patch "customers/withdraw"         => "public/customers#withdraw"

  # カート（destroy_allは:idより前に記述）
  get    "cart_items"             => "public/cart_items#index"
  post   "cart_items"             => "public/cart_items#create"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all", as: :destroy_all_cart_items
  patch  "cart_items/:id"         => "public/cart_items#update",      as: :cart_item
  delete "cart_items/:id"         => "public/cart_items#destroy"

  # 注文（固定パスは:idより前に記述）
  get  "orders/new"     => "public/orders#new"
  post "orders/confirm" => "public/orders#confirm"
  get  "orders/thanks"  => "public/orders#thanks"
  post "orders"         => "public/orders#create"
  get  "orders"         => "public/orders#index"
  get  "orders/:id"     => "public/orders#show", as: :order

  # 配送先
  get    "addresses"          => "public/addresses#index"
  post   "addresses"          => "public/addresses#create"
  get    "addresses/:id/edit" => "public/addresses#edit",   as: :edit_address
  patch  "addresses/:id"      => "public/addresses#update", as: :address
  delete "addresses/:id"      => "public/addresses#destroy"

  # 管理者トップ
  get "admin" => "admin/homes#top"

  # 商品管理
  get   "admin/items"          => "admin/items#index"
  get   "admin/items/new"      => "admin/items#new"
  post  "admin/items"          => "admin/items#create"
  get   "admin/items/:id"      => "admin/items#show",   as: :admin_item
  get   "admin/items/:id/edit" => "admin/items#edit",   as: :edit_admin_item
  patch "admin/items/:id"      => "admin/items#update"

  # ジャンル管理
  get   "admin/genres"          => "admin/genres#index"
  post  "admin/genres"          => "admin/genres#create"
  get   "admin/genres/:id/edit" => "admin/genres#edit",   as: :edit_admin_genre
  patch "admin/genres/:id"      => "admin/genres#update", as: :admin_genre

  # 顧客管理
  get   "admin/customers"          => "admin/customers#index"
  get   "admin/customers/:id"      => "admin/customers#show",   as: :admin_customer
  get   "admin/customers/:id/edit" => "admin/customers#edit",   as: :edit_admin_customer
  patch "admin/customers/:id"      => "admin/customers#update"

  # 注文管理
  get   "admin/orders/:id"                         => "admin/orders#show",          as: :admin_order
  patch "admin/orders/:id"                         => "admin/orders#update"
  patch "admin/orders/:order_id/order_details/:id" => "admin/order_details#update", as: :admin_order_detail


end
