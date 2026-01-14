import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "exercises", "template" ];

  connect () {
    console.log("WorkoutForm connected");
  }

  addExercise(event) {
    event.preventDefault()

    const content = this.templateTarget.innerHTML.replace(
      /NEW_RECORD/g,
      new Date().getTime()
      )
    this.exercisesTarget.insertAdjacentHTML("beforeend", content)
    }

  removeExercise(event) {
    event.preventDefault()
    const exercise = event.target.closest('.exercise-fields')
    const destroyInput = exercise.querySelector("input[name*='_destroy']")
    if (destroyInput) {
      destroyInput.value = "1"
      exercise.style.display = "none"
    } else {
      exercise.remove()
    }
  }
}
