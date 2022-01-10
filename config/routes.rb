Rails.application.routes.draw do
  get 'cards/show'
  resources :products
  resources :orders do
    resources :order_items
  end

  resources :shops, only:[:index]
  resource :cards, only:[:show]
  resources :export_orders, only: :index
  root 'shops#index'
end
