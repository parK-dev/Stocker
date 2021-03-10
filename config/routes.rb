Rails.application.routes.draw do

  devise_for :users
  root 'pages#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_symbol', to: 'stocks#search'
end
