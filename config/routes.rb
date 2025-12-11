Rails.application.routes.draw do
  resources :workouts do
    resources :exercises, only: %i[create update destroy]
  end

  resources :work_sets, only: %i[create update destroy]

  root "workouts#index"
end
