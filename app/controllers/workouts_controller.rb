class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show edit update destroy]

  def index
    @workouts = Workout.order(date: :desc)
  end

  def show
  end

  def new
    @workout = Workout.new
    3.times do
      exercise = @workout.exercises.build
      3.times { exercise.working_sets.build }
    end
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout, notice: "Workout was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @workout = Workout.find(params[:id])
    if @workout.exercises.empty?
      3.times do
        exercise = @workout.exercises.build
        3.times { exercise.working_sets.build }
      end
    else
      @workout.exercises.each do |exercise|
        if exercise.working_sets.empty?
          3.times { exercise.working_sets.build }
        end
      end
    end
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
        :id, :name,
        working_sets_attributes: [
          :id,
          :reps,
          :weight,
          :_destroy ]
      ]
    )
  end
end
