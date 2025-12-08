Rails.application.routes.draw do
  resources :workouts do
    resources :exercises, only: %i[create destroy]
  end

  root "workouts#index"
end
