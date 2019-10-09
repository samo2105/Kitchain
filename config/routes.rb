Rails.application.routes.draw do
  resources :sales
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
