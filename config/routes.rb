Rails.application.routes.draw do
  devise_for :users
  root 'stations#index'

  resources :stations do
    resources :reviews do
      member do
        patch 'vote'
      end
    end
  end

end
