Rails.application.routes.draw do
  resources :responses
  resources :customers, only: :index


  resources :models do
    resources :terms
    resources :customers, only: [:create, :show] do
      resources :answers
    end
  end
  devise_for :users
  resources :users

  root to: 'models#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
