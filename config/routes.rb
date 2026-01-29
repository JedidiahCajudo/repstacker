Rails.application.routes.draw do
  get "sign_up/new"
  get "sign_up/create"
  resource :session
  resources :passwords, param: :token
  resource :sign_up
  resources :workouts do
    resources :exercises, only: %i[create update destroy]
  end
  root "workouts#index"

  get "previous_performance", to: "exercises#previous_performance"

end
