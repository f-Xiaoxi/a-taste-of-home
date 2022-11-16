Rails.application.routes.draw do
  devise_for :users
  root to: "meals#index"

  resources :meals, only: %i[index show new create] do
    resources :orders, only: :create
  end
  resources :orders, only: %i[index edit update]
end
