FauxBook::Application.routes.draw do
  root to: 'root#index'

  devise_for :users

  resources :users, only: [:index, :create, :show, :update] do
    post 'friend_request'
    post 'cancel_request'
    post 'accept_request'
    post 'reject_request'
    post 'unfriend'

    resources :posts, only: [:create]
  end

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:index]

  resources :albums, only: [:index, :create, :show, :update] do
    resources :photos, only: [:create]
  end

  resources :photos, only: [:index, :show, :update] do
    resources :comments, only: [:create]
  end
end
