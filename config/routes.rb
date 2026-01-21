Rails.application.routes.draw do
  resources :workouts do
    resources :exercises, only: %i[create update destroy]
  end
  root "workouts#index"

  get "previous_performance", to: "exercises#previous_performance"

end
