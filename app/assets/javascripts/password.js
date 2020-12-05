document.addEventListener('turbolinks:load', function () {
  let control = document.getElementById('user_password')
  if (control) control.addEventListener('input', checkPasswordConfirmation)

  control = document.getElementById('user_password_confirmation')
  if (control) control.addEventListener('input', checkPasswordConfirmation)
})

function checkPasswordConfirmation() {
  let password = document.getElementById('user_password')
  let confirmation = document.getElementById('user_password_confirmation')

  if (!confirmation.value) {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.add('hide')
    return
  }

  if (password.value === confirmation.value) {
    document.querySelector('.octicon-check').classList.remove('hide')
    document.querySelector('.octicon-x').classList.add('hide')
  }
  else {
    document.querySelector('.octicon-check').classList.add('hide')
    document.querySelector('.octicon-x').classList.remove('hide')
  }
}
