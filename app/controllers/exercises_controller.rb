class ExercisesController < ApplicationController
  before_action :set_workout, except: [ :previous_performance ]

  def create
    @exercise = @workout.exercises.build(exercise_params)
    if @exercise.save
      redirect_to workout_path(@workout), notice: 'Exercise added to workout.'
    else
      redirect_to new_workout_path(@workout), alert: 'Failed to add exercise.'
    end
  end

  def previous_performance
    exercise_name = params[:name]
    previous_exercise = Exercise.where(name: exercise_name).joins(:workout).order('workouts.date DESC').first
    if previous_exercise
      sets_data = previous_exercise.working_sets.order(:created_at).map do |set|
        { reps: set.reps, weight: set.weight}
      end
      render json: { sets: sets_data }
    else
      render json: { sets: [] }
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
