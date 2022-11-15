Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :meals, only: %i[index show new create] do
    resources :orders, only: :create
  end
  resources :orders, only: %i[index edit update]
end
