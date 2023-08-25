import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

if ("scrollRestoration" in window.history) {
  window.history.scrollRestoration = "manual";
}

export { application }
