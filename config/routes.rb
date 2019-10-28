Rails.application.routes.draw do
  patch 'payed/:id', to: 'sale_updates#payed', as: 'payed'
  patch 'given/:id', to: 'sale_updates#given', as: 'given'
  patch 'ready/:id', to: 'sale_updates#ready', as: 'ready'
  patch 'done/:id', to: 'sale_updates#done', as: 'done'
resources :orders, only: [:create]
  delete 'orders/:id', to: 'orders#delete', as: 'delete_order'
  get 'dashboards/commerce', to: 'dashboards#commerce_index'
  get 'dashboards/commerce_sales'
  get 'dashboards/commerce_kitchen'
  get 'dashboards/commerce_generals'
  get 'dashboards/workers', to: 'dashboards#workers_index'
  get 'dashboards/workers_kitchen'
  get 'dashboards/workers_products'
  get 'dashboards/workers_sales'
  get 'dashboards/workers_tables'
  resources :orders, only: [:create, :delete]
  resources :sales
  resources :orders, only: [:update, :delete]
  resources :products
  devise_for :workers, controllers:
      {registrations: 'workers/registrations',
      sessions: 'workers/sessions'}
  resources :workers
  resources :offices
  devise_for :commerces, controllers:{
      registrations: 'commerces/registrations',
      sessions: 'commerces/sessions'}
  resources :commerces
  get 'landing', to: 'landing#index'
  get 'landing/features', to: 'landing#features', as: 'features'
  get 'landing/pricing', to: 'landing#pricing', as: 'pricing'
  root 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
