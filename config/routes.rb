Rails.application.routes.draw do
  devise_for :users
  resources :projects, only: [:index, :show, :create, :update] do
    resources :comments, only: [:create]
    resources :status_changes, only: [:create]
  end
  root "projects#index"
end
