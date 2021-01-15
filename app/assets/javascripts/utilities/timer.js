document.addEventListener('turbolinks:load', function () {
  let timerControl = document.getElementById('timer')
  if (!timerControl) return

  let timerSeconds = Number(timerControl.dataset.timer)
  if (!timerSeconds) return

  let timer = setInterval(function () {
    let seconds = Math.trunc(timerSeconds % 60)
    let minutes = Math.trunc(timerSeconds / 60 % 60)
    let hours   = Math.trunc(timerSeconds / 60 / 60)

    if (timerSeconds <= 0) {
      clearInterval(timer)
      document.location.href = document.location.href + '/result'
    }
    else {
      timerControl.innerHTML =
        `${ hours ? `${hours}:` : '' }` +
        `${ hours || minutes ? `${ hours ? String(minutes).padStart(2, '0') : minutes }:` : '' }` +
        `${ hours || minutes ? String(seconds).padStart(2, '0') : seconds }`
    }
    --timerSeconds;
  }, 1000)
})
