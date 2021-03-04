Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  root to: 'pages#home'

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

  resources :orders, only: [:new, :create, :destroy]

  get '/cart', to: 'orders#checkout'
end
