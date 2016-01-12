Rails.application.routes.draw do
  devise_for :users
  root 'stations#index'
  resources :stations, except: [:edit] do
    resources :reviews, except: [:edit]
  end

end
