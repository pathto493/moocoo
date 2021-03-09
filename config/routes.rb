Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  root to: 'pages#home'

  get '/profile', to: 'pages#profile'
  get '/search', to: 'pages#search'
  get 'cart', to: 'orders#cart'
  get 'admin', to: 'pages#admin'

  resources :videos, only: [:index, :show, :new, :create] do
    collection do
      get :home
    end
  end

  resources :products, only: [:index, :show, :update, :create] do
    resources :photos, only: [:destroy]
    resources :reviews, only: [ :create, :edit, :update ]
    collection do
      get :home
    end
  end

  resources :brands, only: [:index, :show]
  resources :reviews, only: [ :destroy ]

  resources :orders, only: [:create, :destroy]

  post '/vidcreateorder', to: 'orders#vidcreateorder'

  resources :purchases, only: [:index, :show, :create, :destroy] do
    resources :payments, only: [:new]
    get '/payments/success', to: 'payments#success'
    get '/payments/cancel', to: 'payments#cancel'
  end

  resources :forums, only: [:index, :show] do
    resources :messages, only: :create
  end

  resources :articles, only: [:index, :show]
end
