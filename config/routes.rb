Rails.application.routes.draw do

  root 'pages#index'

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/login' => 'devise/sessions#new', as: 'login'
  end
end
