Rails.application.routes.draw do
  get 'top/index'
  devise_for :users, controllers: {   registrations: 'users/registrations',
    sessions: 'users/sessions' }
  root to: "top#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new,:index, :create, :destroy] do
    resources :memos, only: [:index, :create]
  end
end
