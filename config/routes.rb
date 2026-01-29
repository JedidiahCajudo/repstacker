Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :workouts do
    resources :exercises, only: %i[create update destroy]
  end
  root "workouts#index"

  get "previous_performance", to: "exercises#previous_performance"

end
