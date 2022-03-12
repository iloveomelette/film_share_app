Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts do
    resource :likes, only: %i[create destroy]
  end
  devise_for :users
end
