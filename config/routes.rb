Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "/user-profile", to: "pages#user_profile", as: "user_profile"
  get "/journal", to: "pages#journal", as: "journal"

  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy], shallow: true
    resources :tags, only: [:new, :create, :destroy], shallow: true
    resources :user_reviews
  end

  resources :ingredients, only: [:new, :create]

end
