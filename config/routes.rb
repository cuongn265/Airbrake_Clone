Rails.application.routes.draw do

  get 'pages/index'

  get 'pages/index'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'pages#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
