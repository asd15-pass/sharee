Rails.application.routes.draw do
  get 'top/index'
  devise_for :users
  root to: "top#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :memos, only: [:index, :create]
  end
end
