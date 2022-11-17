Rails.application.routes.draw do
  devise_for :users
  root to: "meals#index"

  resources :meals, only: %i[index show new create] do
    resources :orders, only: :create
    collection do
      get :mine
    end
  end
  resources :orders, only: %i[index edit update]
end
