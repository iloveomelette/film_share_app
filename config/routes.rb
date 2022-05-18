Rails.application.routes.draw do
  root 'homes#top'
  resources :posts do
    resource :likes, only: %i[create destroy]
  end
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
