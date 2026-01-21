import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "exercises", "template" ];

  connect () {
    console.log("WorkoutForm connected");
    this.setCounter = 0;
  }

  addExercise(event) {
    event.preventDefault()
    console.log("workout-form: addExercise called")
    const timestamp = new Date().getTime()
    const wrapper = document.createElement('div')
    wrapper.appendChild(this.templateTarget.content.cloneNode(true))
    const content = wrapper.innerHTML.replace(/NEW_EXERCISE/g, timestamp)
    this.exercisesTarget.insertAdjacentHTML("beforeend", content)
    console.log("workout-form: exercise added", timestamp)
  }

  removeExercise(event) {
    event.preventDefault()
    const exercise = event.target.closest('.exercise-fields')
    const destroyInput = exercise.querySelector("input[name*='exercises'][name*='_destroy']")
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
    this.setCounter++
    const uniqueID = new Date().getTime() + this.setCounter
    const wrapper = document.createElement('div')
    wrapper.appendChild(setTemplate.content.cloneNode(true))
    wrapper.innerHTML = wrapper.innerHTML.replace(/NEW_SET/g, uniqueID)
    const newSet = wrapper.firstElementChild
    const lastSet = setsContainer.querySelector('.set-fields:last-of-type:not([style*="display: none"])')
    if (lastSet) {
      newSet.querySelector('[name*="weight"]').value = lastSet.querySelector('[name*="weight"]').value
      newSet.querySelector('[name*="reps"]').value = lastSet.querySelector('[name*="reps"]').value
    }
    setsContainer.appendChild(newSet)
    console.log("workout-form: set added", uniqueID)
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

  fetchPreviousPerformance(event) {
    const exerciseFields = event.target.closest('.exercise-fields')
    const exerciseName = event.target.value.trim()
    if (!exerciseName) return
    fetch(`/previous_performance?name=${exerciseName}`)
      .then(response => response.json())
      .then(data => {
        if (data.sets && data.sets.length > 0) {
          this.populateSets(exerciseFields, data.sets)
        }
     })

    }
    populateSets(exerciseFields, setsData) {
      const setsContainer = exerciseFields.querySelector('.sets-container')
      const setTemplate = exerciseFields.querySelector('.set-template')
      const existingSets = setsContainer.querySelectorAll('.set-fields')
      existingSets.forEach(set => set.remove())
      setsData.forEach(setData => {
        this.setCounter++
        const uniqueID = new Date().getTime() + this.setCounter
        const wrapper = document.createElement('div')
        wrapper.appendChild(setTemplate.content.cloneNode(true))
        wrapper.innerHTML = wrapper.innerHTML.replace(/NEW_SET/g, uniqueID)
        const newSet = wrapper.firstElementChild
        newSet.querySelector('[name*="weight"]').value = setData.weight
        newSet.querySelector('[name*="reps"]').value = setData.reps
        setsContainer.appendChild(newSet)
        console.log("workout-form: set added", uniqueID)
      })
    }
}
