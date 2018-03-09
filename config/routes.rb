Rails.application.routes.draw do
  get 'stocks/show'

  get 'portfolios/show'

  devise_for :users
  root to: 'pages#home'
  resources :users
  resources :portfolios do
    resources :stocks, except: [:destroy]
  end
  resources :stocks, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
