class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]

  def index
    @workouts = Workout.order(date: :desc)
  end

  def show
  end

  def new
    @workout = Workout.new
    3.times { @workout.exercises.build }
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workouts_path, notice: "Workout was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to @workout
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, notice: "Workout was successfully destroyed."
  end

  private
  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(
      :date,
      exercises_attributes: [
        :id, :name, :weight, :repetitions, :_destroy
      ]
    )
  end
end
