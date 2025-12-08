class ExercisesController < ApplicationController
  before_action :set_workout

  def create
    @exercise = @workout.exercises.build(exercise_params)
    if @exercise.save
      redirect_to workout_path(@workout), notice: 'Exercise added to workout.'
    else
      redirect_to new_workout_path(@workout), alert: 'Failed to add exercise.'
    end
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def exercise_params
    params.require(:exercise).permit(:name)
  end

end
