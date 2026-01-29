Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :passwords, param: :token
  resource :sign_up, only: %i[new create]

  namespace :settings do
    root "base#index"
    resource :email, only: [ :show, :update ]
    resource :password, only: [ :show, :update ]
    resource :user, only: [ :show, :destroy ]
  end

  namespace :email do
    resources :confirmations, param: :token, only: [ :show ]
  end

  resources :workouts do
    resources :exercises, only: %i[create update destroy]
  end

  root "workouts#index"

  get "previous_performance", to: "exercises#previous_performance"
end
