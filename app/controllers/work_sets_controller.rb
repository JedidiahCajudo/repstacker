class WorkSetsController < ApplicationController
  before_action :set_workout, only: %i[create update destroy]
  before_action :set_exercise, only: %i[create update destroy]
  before_action :set_work_set, only: %i[update destroy]

  def create
    @work_set = @work_sets.new(work_set_params)

    if @work_set.save
      redirect_to workout_path(@workout), notice: 'Work set added to exercise.'
    else
      render :new, alert: 'Failed to add work set.'
    end
  end

  def update
    if @work_set.update(work_set_params)
      redirect_to workout_exercise_path(@workout, @exercise), notice: 'Work set updated.'
    else
      render :edit, alert: 'Failed to update work set.'
    end
  end

  def destroy
    @work_set.destroy
    redirect_to workout_exercise_path(@workout, @exercise), notice: 'Work set deleted.'
  end

  private
  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

  def set_exercise
    @exercise = @workout.exercises.find(params[:exercise_id])
  end

  def set_work_set
    @work_set = @exercise.work_sets.find(params[:id])
  end
end
