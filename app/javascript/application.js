import "@hotwired/turbo-rails";
import "controllers";
import "bootstrap";
import "@popperjs/core";

document.addEventListener('DOMContentLoaded', function () {
  document.addEventListener('click', function (event) {
    if (event.target.classList.contains('add_fields')) {
      event.preventDefault();
      const time = new Date().getTime();
      const regexp = new RegExp(event.target.dataset.id, 'g');
      const newFields = event.target.dataset.fields.replace(regexp, time);
      const fieldsContainer = document.querySelector('.fields');
      if (fieldsContainer) {
        fieldsContainer.insertAdjacentHTML('beforeend', newFields);
      }
    }
  });

});

document.addEventListener('turbo:frame-load', function(event) {

  if (event.target.id.startsWith('meetingmodal')) {

    const modalElement = event.target.querySelector('.modal');
    if (modalElement) {
      const modal = new bootstrap.Modal(modalElement);
      modal.show();
    }
  }
});
