Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  root to: 'pages#home'

  get '/profile', to: 'pages#profile'
  get '/search', to: 'pages#search'
  get 'cart', to: 'orders#cart'

  resources :videos, only: [:index, :show] do
    collection do
      get :home
    end
  end

  resources :products, only: [:index, :show, :update] do
    resources :photos, only: [:destroy]
    collection do
      get :home
    end
  end

  resources :orders, only: [:create, :destroy]

  resources :purchases, only: [:index, :show, :create, :destroy] do
    resources :payments, only: [:new]
    get '/payments/success', to: 'payments#success'
    get '/payments/cancel', to: 'payments#cancel'
  end

end
