# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'Евгений', email: 'a@a.com')
user2 = User.create(name: 'Сергей', email: 'b@b.com')

category = Category.create(title: 'Java')
  test     = Test.create(title: 'Java - Основы', level: 1, category_id: category.id, author_id: user1.id)
    question = Question.create(text: 'Какие пакеты автоматически импортируются во все Java-программы?', test_id: test.id)
      question.answers.build(text: 'java.util')
      question.answers.build(text: 'java.lang')
      question.answers.build(text: 'java.security')
      question.answers.build(text: 'java.io', correct: true)
      question.save
    question = Question.create(text: 'Какая максимальная длина имени переменной допустима в Java?', test_id: test.id)
      question.answers.build(text: '256', correct: true)
      question.answers.build(text: '1024')
      question.answers.build(text: '8')
      question.answers.build(text: 'не ограничена')
      question.save
    question = Question.create(text: 'Каким образом можно запретить наследование класса?', test_id: test.id)
      question.answers.build(text: 'Добавить модификатор final', correct: true)
      question.answers.build(text: 'Не определять конструктор')
      question.answers.build(text: 'Добавить модификатор private')
      question.answers.build(text: 'Запретить наследование нельзя')
      question.save
    user1.tests << test

category = Category.create(title: 'Python')
  test     = Test.create(title: 'Python - Основы', level: 1, category_id: category.id, author_id: user1.id)
    question = Question.new(text: 'Что напечатает код?\ndef func(n):\n  n = n + 1\nprint(func(0))', test_id: test.id)
      question.answers.build(text: '0')
      question.answers.build(text: '1', correct: true)
      question.answers.build(text: 'func(0)')
      question.answers.build(text: 'None')
      # question.answers.build(text: 'Ошибка')
      question.save
    question = Question.create(text: 'Какой результат даст выражение True + 4?', test_id: test.id)
      question.answers.build(text: 'False')
      question.answers.build(text: 'True', correct: true)
      question.answers.build(text: '5')
      question.answers.build(text: 'Ошибка')
      question.save
    question = Question.create(text: 'Какая из функций вернёт вернёт итерируемый объект?', test_id: test.id)
      question.answers.build(text: 'len()')
      question.answers.build(text: 'xrange()')
      question.answers.build(text: 'range()', correct: true)
      question.answers.build(text: 'ord()')
      question.save
    user1.tests << test
    user2.tests << test

category = Category.create(title: 'CSS')
  test     = Test.create(title: 'CSS - Основы', level: 0, category_id: category.id, author_id: user1.id)
    question = Question.create(text: 'Какую рамку задаёт следующая строка? Border: 2px dotted #0000FF;', test_id: test.id)
      question.answers.build(text: '2px, синюю, пунктирную', correct: true)
      question.answers.build(text: '2px, зелёную, пунктирную')
      question.answers.build(text: '2px, красную, сплошную')
      question.answers.build(text: '2px, синюю, двойную')
      question.save
    question = Question.create(text: 'Какое свойство для создания и управления колонками в многоколоночном тексте ' +
                                     'позволяет изменить расстояние между ними?', test_id: test.id)
      question.answers.build(text: 'margin')
      question.answers.build(text: 'column-padding')
      question.answers.build(text: 'column-margin')
      # question.answers.build(text: 'padding')
      question.answers.build(text: 'column-gap', correct: true)
      question.save
    question = Question.create(text: 'Какие значения может принимать opacity?', test_id: test.id)
      question.answers.build(text: '0-100', correct: true)
      question.answers.build(text: '0-50')
      question.answers.build(text: '0-10')
      question.answers.build(text: '0-1')
      question.save
    user1.tests << test
    user2.tests << test

category = Category.create(title: 'SQL')
  test     = Test.create(title: 'SQL - Основы', level: 2, category_id: category.id, author_id: user1.id)
    question = Question.create(text: 'Какое необязательное ключевое слово пропущено в выражении? \ninsert table_name ' +
                                     '(column1, column2) values ("value1", "value2")', test_id: test.id)
      question.answers.build(text: 'OUT')
      question.answers.build(text: 'IN')
      question.answers.build(text: 'NAME')
      question.answers.build(text: 'TO', correct: true)
      question.save
   question = Question.create(text: 'Какое представление имеет значение ноль для типа DATE?', test_id: test.id)
      question.answers.build(text: '00:00:00')
      question.answers.build(text: '0000')
      question.answers.build(text: '00-00-0000')
      # question.answers.build(text: '00-00-00')
      question.answers.build(text: '0000-00-00', correct: true)
      question.save
    question = Question.create(text: 'Перечислите все способы создания новой базы animals.', test_id: test.id)
      question.answers.build(text: 'CREATE NEW DATABASE animals;')
      question.answers.build(text: 'CREATE SCHEMA animals;')
      question.answers.build(text: 'CREATE DATABASE IF NOT EXISTS;')
      # question.answers.build(text: 'CREATE animals AS DATABASE;')
      question.answers.build(text: 'CREATE DATABASE animals;', correct: true)
      question.save
    user2.tests << test
