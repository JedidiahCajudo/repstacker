import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "exercises", "template" ];

  connect () {
    console.log("WorkoutForm connected");
  }

  addExercise(event) {
    event.preventDefault()
    console.log("workout-form: addExercise called")

    const timestamp = new Date().getTime()

    // Clone the <template> content to ensure we get the fragment
    const wrapper = document.createElement('div')
    wrapper.appendChild(this.templateTarget.content.cloneNode(true))

    const content = wrapper.innerHTML.replace(/NEW_RECORD/g, timestamp)
    this.exercisesTarget.insertAdjacentHTML("beforeend", content)

    console.log("workout-form: exercise added", timestamp)
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
