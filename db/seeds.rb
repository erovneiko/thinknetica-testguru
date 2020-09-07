# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([
  { title: 'Java' },
  { title: 'Python' },
  { title: 'CSS' },
  { title: 'SQL' }
])

Test.create([
  { title: 'Java - Основы', level: '0', category_id: '1' },
  { title: 'Python - Основы', level: '0', category_id: '2' },
  { title: 'CSS - Основы', level: '0', category_id: '3' },
  { title: 'SQL - Основы', level: '0', category_id: '4' }
])

Question.create([
  { text: 'Какие пакеты автоматически импортируются во все Java-программы?', test_id: 1 },
  { text: 'Какая максимальная длина имени переменной допустима в Java?', test_id: 1 },
  { text: 'Каким образом можно запретить наследование класса?', test_id: 1 },
  { text: 'Что напечатает код?\ndef func(n):\n  n = n + 1\nprint(func(0))', test_id: 2 },
  { text: 'Какой результат даст выражение True + 4?', test_id: 2 },
  { text: 'Какая из функций вернёт вернёт итерируемый объект?', test_id: 2 },
  { text: 'Какую рамку задаёт следующая строка? Border: 2px dotted #0000FF;', test_id: 3 },
  { text: 'Какое свойство для создания и управления колонками в многоколоночном тексте ' +
          'позволяет изменить расстояние между ними?', test_id: 3 },
  { text: 'Какие значения может принимать opacity?', test_id: 3 },
  { text: 'Какое необязательное ключевое слово пропущено в выражении? \ninsert table_name (column1, column2) values ("value1", "value2")', test_id: 4 },
  { text: 'Какое представление имеет значение ноль для типа DATE?', test_id: 4 },
  { text: 'Перечислите все способы создания новой базы animals.', test_id: 4 }
])

Answer.create([
  { text: 'java.util', correct: false, question_id: 1 },
  { text: 'java.lang', correct: false, question_id: 1 },
  { text: 'java.security', correct: false, question_id: 1 },
  { text: 'java.io', correct: false, question_id: 1 },
  { text: '256', correct: false, question_id: 2 },
  { text: '1024', correct: false, question_id: 2 },
  { text: '8', correct: false, question_id: 2 },
  { text: 'не ограничена', correct: false, question_id: 3 },
  { text: 'Добавить модификатор final', correct: false, question_id: 3 },
  { text: 'Не определять конструктор', correct: false, question_id: 3 },
  { text: 'Добавить модификатор private', correct: false, question_id: 3 },
  { text: 'Запретить наследование нельзя', correct: false, question_id: 3 },
  { text: '0', correct: false, question_id: 4 },
  { text: '1', correct: false, question_id: 4 },
  { text: 'func(0)', correct: false, question_id: 4 },
  { text: 'None', correct: false, question_id: 4 },
  { text: 'Ошибка', correct: false, question_id: 4 },
  { text: 'False', correct: false, question_id: 5 },
  { text: 'True', correct: false, question_id: 5 },
  { text: '5', correct: false, question_id: 5 },
  { text: 'Ошибка', correct: false, question_id: 5 },
  { text: 'len()', correct: false, question_id: 6 },
  { text: 'xrange()', correct: false, question_id: 6 },
  { text: 'range()', correct: false, question_id: 6 },
  { text: 'ord()', correct: false, question_id: 6 },
  { text: '2px, синюю, пунктирную', correct: false, question_id: 7 },
  { text: '2px, зелёную, пунктирную', correct: false, question_id: 7 },
  { text: '2px, красную, сплошную', correct: false, question_id: 7 },
  { text: '2px, синюю, двойную', correct: false, question_id: 7 },
  { text: 'margin', correct: false, question_id: 8 },
  { text: 'column-padding', correct: false, question_id: 8 },
  { text: 'column-margin', correct: false, question_id: 8 },
  { text: 'padding', correct: false, question_id: 8 },
  { text: 'column-gap', correct: false, question_id: 8 },
  { text: '0-100', correct: false, question_id: 9 },
  { text: '0-50', correct: false, question_id: 9 },
  { text: '0-10', correct: false, question_id: 9 },
  { text: '0-1', correct: false, question_id: 9 },
  { text: 'OUT', correct: false, question_id: 10 },
  { text: 'IN', correct: false, question_id: 10 },
  { text: 'NAME', correct: false, question_id: 10 },
  { text: 'TO', correct: false, question_id: 10 },
  { text: '00:00:00', correct: false, question_id: 11 },
  { text: '0000', correct: false, question_id: 11 },
  { text: '00-00-0000', correct: false, question_id: 11 },
  { text: '00-00-00', correct: false, question_id: 11 },
  { text: '0000-00-00', correct: false, question_id: 11 },
  { text: 'CREATE NEW DATABASE animals;', correct: false, question_id: 12 },
  { text: 'CREATE SCHEMA animals;', correct: false, question_id: 12 },
  { text: 'CREATE DATABASE IF NOT EXISTS;', correct: false, question_id: 12 },
  { text: 'CREATE animals AS DATABASE;', correct: false, question_id: 12 },
  { text: 'CREATE DATABASE animals;', correct: false, question_id: 12 }
])

User.create([
  { name: 'Евгений' },
  { name: 'Сергей' }
])
