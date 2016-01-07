Rails.application.routes.draw do
  devise_for :users
  root 'stations#index'

  resources :stations, only: [:new, :index, :create, :show] do
    resources :reviews, only: [:new, :create, :index, :update]
  end

end
