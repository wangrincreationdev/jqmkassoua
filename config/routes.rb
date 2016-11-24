Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :announces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'seller' => 'announces#seller'

  root 'announces#index'
end
