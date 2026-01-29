Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :passwords, param: :token
  resource :sign_up, only: %i[new create]

  resources :workouts do
    resources :exercises, only: %i[create update destroy]
  end

  root "sign_ups#new"

  get "previous_performance", to: "exercises#previous_performance"

end
