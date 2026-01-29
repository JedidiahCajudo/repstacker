Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :passwords, param: :token
  resource :sign_up, only: %i[new create]

  namespace :settings do
    resource :password, only: [ :show, :update ]
    resource :profile, only: [ :show, :update ]

    root to: redirect("/settings/profile")
  end

  resources :workouts do
    resources :exercises, only: %i[create update destroy]
  end

  root "workouts#index"

  get "previous_performance", to: "exercises#previous_performance"

end
