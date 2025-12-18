import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "exercises" ];

  addExercise(event) {
    event.preventDefault();
    const newExercise = this.exercisesTarget.querySelector('.exercise-fields').cloneNode(true);
    this.exercisesTarget.appendChild(newExercise);
  }

  removeExercise(event) {
    event.preventDefault();
    const exerciseFields = event.target.closest('.exercise-fields');
    if (this.exercisesTarget.children.length > 1) {
      exerciseFields.remove();
    }
 }
}
