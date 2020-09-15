# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'Евгений')
user2 = User.create(name: 'Сергей')

category = Category.create(title: 'Java')
  test     = Test.create(title: 'Java - Основы', level: 1, category_id: category.id, author_id: user1.id)
    question = Question.create(text: 'Какие пакеты автоматически импортируются во все Java-программы?', test_id: test.id)
      answer   = Answer.create(text: 'java.util', question_id: question.id)
      answer   = Answer.create(text: 'java.lang', question_id: question.id)
      answer   = Answer.create(text: 'java.security', question_id: question.id)
      answer   = Answer.create(text: 'java.io', question_id: question.id)
    question = Question.create(text: 'Какая максимальная длина имени переменной допустима в Java?', test_id: test.id)
      answer   = Answer.create(text: '256', question_id: question.id)
      answer   = Answer.create(text: '1024', question_id: question.id)
      answer   = Answer.create(text: '8', question_id: question.id)
      answer   = Answer.create(text: 'не ограничена', question_id: question.id)
    question = Question.create(text: 'Каким образом можно запретить наследование класса?', test_id: test.id)
      answer   = Answer.create(text: 'Добавить модификатор final', question_id: question.id)
      answer   = Answer.create(text: 'Не определять конструктор', question_id: question.id)
      answer   = Answer.create(text: 'Добавить модификатор private', question_id: question.id)
      answer   = Answer.create(text: 'Запретить наследование нельзя', question_id: question.id)
    user1.tests << test

category = Category.create(title: 'Python')
  test     = Test.create(title: 'Python - Основы', level: 1, category_id: category.id, author_id: user1.id)
    question = Question.create(text: 'Что напечатает код?\ndef func(n):\n  n = n + 1\nprint(func(0))', test_id: test.id)
      answer   = Answer.create(text: '0', question_id: question.id)
      answer   = Answer.create(text: '1', question_id: question.id)
      answer   = Answer.create(text: 'func(0)', question_id: question.id)
      answer   = Answer.create(text: 'None', question_id: question.id)
      answer   = Answer.create(text: 'Ошибка', question_id: question.id)
    question = Question.create(text: 'Какой результат даст выражение True + 4?', test_id: test.id)
      answer   = Answer.create(text: 'False', question_id: question.id)
      answer   = Answer.create(text: 'True', question_id: question.id)
      answer   = Answer.create(text: '5', question_id: question.id)
      answer   = Answer.create(text: 'Ошибка', question_id: question.id)
    question = Question.create(text: 'Какая из функций вернёт вернёт итерируемый объект?', test_id: test.id)
      answer   = Answer.create(text: 'len()', question_id: question.id)
      answer   = Answer.create(text: 'xrange()', question_id: question.id)
      answer   = Answer.create(text: 'range()', question_id: question.id)
      answer   = Answer.create(text: 'ord()', question_id: question.id)
    user1.tests << test
    user2.tests << test

category = Category.create(title: 'CSS')
  test     = Test.create(title: 'CSS - Основы', level: 0, category_id: category.id, author_id: user1.id)
    question = Question.create(text: 'Какую рамку задаёт следующая строка? Border: 2px dotted #0000FF;', test_id: test.id)
      answer   = Answer.create(text: '2px, синюю, пунктирную', question_id: question.id)
      answer   = Answer.create(text: '2px, зелёную, пунктирную', question_id: question.id)
      answer   = Answer.create(text: '2px, красную, сплошную', question_id: question.id)
      answer   = Answer.create(text: '2px, синюю, двойную', question_id: question.id)
    question = Question.create(text: 'Какое свойство для создания и управления колонками в многоколоночном тексте ' +
                                     'позволяет изменить расстояние между ними?', test_id: test.id)
      answer   = Answer.create(text: 'margin', question_id: question.id)
      answer   = Answer.create(text: 'column-padding', question_id: question.id)
      answer   = Answer.create(text: 'column-margin', question_id: question.id)
      answer   = Answer.create(text: 'padding', question_id: question.id)
      answer   = Answer.create(text: 'column-gap', question_id: question.id)
    question = Question.create(text: 'Какие значения может принимать opacity?', test_id: test.id)
      answer   = Answer.create(text: '0-100', question_id: question.id)
      answer   = Answer.create(text: '0-50', question_id: question.id)
      answer   = Answer.create(text: '0-10', question_id: question.id)
      answer   = Answer.create(text: '0-1', question_id: question.id)
    user1.tests << test
    user2.tests << test

category = Category.create(title: 'SQL')
  test     = Test.create(title: 'SQL - Основы', level: 2, category_id: category.id, author_id: user1.id)
    question = Question.create(text: 'Какое необязательное ключевое слово пропущено в выражении? \ninsert table_name ' +
                                     '(column1, column2) values ("value1", "value2")', test_id: test.id)
      answer   = Answer.create(text: 'OUT', question_id: question.id)
      answer   = Answer.create(text: 'IN', question_id: question.id)
      answer   = Answer.create(text: 'NAME', question_id: question.id)
      answer   = Answer.create(text: 'TO', question_id: question.id)
    question = Question.create(text: 'Какое представление имеет значение ноль для типа DATE?', test_id: test.id)
      answer   = Answer.create(text: '00:00:00', question_id: question.id)
      answer   = Answer.create(text: '0000', question_id: question.id)
      answer   = Answer.create(text: '00-00-0000', question_id: question.id)
      answer   = Answer.create(text: '00-00-00', question_id: question.id)
      answer   = Answer.create(text: '0000-00-00', question_id: question.id)
    question = Question.create(text: 'Перечислите все способы создания новой базы animals.', test_id: test.id)
      answer   = Answer.create(text: 'CREATE NEW DATABASE animals;', question_id: question.id)
      answer   = Answer.create(text: 'CREATE SCHEMA animals;', question_id: question.id)
      answer   = Answer.create(text: 'CREATE DATABASE IF NOT EXISTS;', question_id: question.id)
      answer   = Answer.create(text: 'CREATE animals AS DATABASE;', question_id: question.id)
      answer   = Answer.create(text: 'CREATE DATABASE animals;', question_id: question.id)
    user2.tests << test
