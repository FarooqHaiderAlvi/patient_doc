import { Application } from "@hotwired/stimulus"
import '../bootstrap/dist/css/bootstrap.css';
import '../bootstrap/dist/js/bootstrap';
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
