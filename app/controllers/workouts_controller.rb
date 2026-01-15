class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show update destroy]

  def index
    @workouts = Workout.order(date: :desc)
  end

  def show
  end

  def new
    @workout = Workout.new
    exercise = @workout.exercises.build
    exercise.working_sets.build

    @workout.exercises.build if params[:add_exercise]

  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout, notice: "Workout was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout
    else
      render :show, status: :unprocessable_entity
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
        :id, :name, :_destroy,
        working_sets_attributes: [
          :id,
          :reps,
          :weight,
          :_destroy ]
      ]
    )
  end
end
