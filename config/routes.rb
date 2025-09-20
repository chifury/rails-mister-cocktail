Rails.application.routes.draw do
  root to: "cocktails#index"

  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy], shallow: true
    resources :tags, only: [:new, :create, :destroy], shallow: true
  end

  resources :ingredients, only: [:new, :create]
end
