Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :stations, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reviews, only: [:new, :create, :edit, :update]
  end

end
