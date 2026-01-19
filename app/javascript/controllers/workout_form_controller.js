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

  addSet(event) {
    event.preventDefault()
    const exerciseFields = event.target.closest('.exercise-fields')
    const setsContainer = exerciseFields.querySelector('.sets-container')
    const setTemplate = exerciseFields.querySelector('.set-template')
    const timestamp = new Date().getTime()
    const wrapper = document.createElement('div')
    wrapper.appendChild(setTemplate.content.cloneNode(true))
    wrapper.innerHTML = wrapper.innerHTML.replace(/NEW_RECORD/g, timestamp)
    const newSet = wrapper.firstElementChild
    const lastSet = setsContainer.querySelector('.set-fields:last-of-type:not([stlyle*="display: none"])')
    if (lastSet) {
      newSet.querySelector('[name*="weight"]').value = lastSet.querySelector('[name*="weight"]').value
      newSet.querySelector('[name*="reps"]').value = lastSet.querySelector('[name*="reps"]').value
    }
    setsContainer.appendChild(newSet)
    console.log("workout-form: set added", timestamp)
  }

  removeSet(event) {
    event.preventDefault()
    const set = event.target.closest('.set-fields')
    const destroyInput = set.querySelector("input[name*='_destroy']")
    if (destroyInput) {
      destroyInput.value = "1"
      set.style.display = "none"
    } else {
      set.remove()
    }
  }
}
