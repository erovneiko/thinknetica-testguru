document.addEventListener('turbolinks:load', function () {
  let progressBar = document.querySelector('.progress-bar')
  let progressLine = document.querySelector('.progress-line')

  if (!progressBar) return;

  let total = progressBar.dataset.total
  let index = progressLine.dataset.index

  progressLine.style.width = index / total * 100 + '%'
})
