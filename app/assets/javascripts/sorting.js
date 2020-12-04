document.addEventListener('turbolinks:load', function () {
  let control = document.querySelector('.sort-by-title')

  if (control) control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
  let table = document.querySelector('table')

  // NodeList
  let rows = table.querySelectorAll('tr')

  // Array
  let sortedRows = []
  for (let i = 1; i < rows.length; i++)
    sortedRows.push(rows[i])

  if (this.querySelector('.octicon-arrow-down').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }
  else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  }

  // Table
  let sortedTable = document.createElement('table')
  sortedTable.classList.add('tests')
  sortedTable.classList.add('table')
  sortedTable.classList.add('table-striped')
  sortedTable.appendChild(rows[0])
  for (let i = 0; i < sortedRows.length; i++)
    sortedTable.appendChild(sortedRows[i])

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  let cellText1 = row1.querySelector('td').textContent
  let cellText2 = row2.querySelector('td').textContent

  if (cellText1 < cellText2) return -1
  else if (cellText1 > cellText2) return 1
  else return 0
}

function compareRowsDesc(row1, row2) {
  let cellText1 = row1.querySelector('td').textContent
  let cellText2 = row2.querySelector('td').textContent

  if (cellText1 < cellText2) return 1
  else if (cellText1 > cellText2) return -1
  else return 0
}
