# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name: "Евгений", email: "erovneiko@mail.ru")
user2 = User.create(name: "Сергей", email: "sergey@gmail.com")

category = Category.create(title: "Java")
  test     = category.tests.create(title: "Java - Основы", level: 1, author_id: user1.id)
    question = test.questions.create(text: "Какие пакеты автоматически импортируются во все Java-программы?")
      question.answers.create(text: "java.util")
      question.answers.create(text: "java.lang")
      question.answers.create(text: "java.security")
      question.answers.create(text: "java.io", correct: true)
    question = test.questions.create(text: "Какая максимальная длина имени переменной допустима в Java?")
      question.answers.create(text: "256", correct: true)
      question.answers.create(text: "1024")
      question.answers.create(text: "8")
      question.answers.create(text: "не ограничена")
    question = test.questions.create(text: "Каким образом можно запретить наследование класса?")
      question.answers.create(text: "Добавить модификатор final", correct: true)
      question.answers.create(text: "Не определять конструктор")
      question.answers.create(text: "Добавить модификатор private")
      question.answers.create(text: "Запретить наследование нельзя")

user1.tests << test

category = Category.create(title: "Python")
  test     = category.tests.create(title: "Python - Основы", level: 1, author_id: user1.id)
    question = test.questions.create(text: "Что напечатает код?<pre>def func(n)\\nn = n + 1\\nprint(func(0))</pre>")
      question.answers.create(text: "0")
      question.answers.create(text: "1", correct: true)
      question.answers.create(text: "func(0)")
      question.answers.create(text: "None")
      # question.answers.create(text: "Ошибка")
    question = test.questions.create(text: "Какой результат даст выражение True + 4?")
      question.answers.create(text: "False")
      question.answers.create(text: "True", correct: true)
      question.answers.create(text: "5")
      question.answers.create(text: "Ошибка")
    question = test.questions.create(text: "Какая из функций вернёт вернёт итерируемый объект?")
      question.answers.create(text: "len()")
      question.answers.create(text: "xrange()")
      question.answers.create(text: "range()", correct: true)
      question.answers.create(text: "ord()")

user1.tests << test
user2.tests << test

category = Category.create(title: "CSS")
  test     = category.tests.create(title: "CSS - Основы", level: 0, author_id: user1.id)
    question = test.questions.create(text: "Какую рамку задаёт следующая строка?<pre>Border: 2px dotted #0000FF;</pre>")
      question.answers.create(text: "2px, синюю, пунктирную", correct: true)
      question.answers.create(text: "2px, зелёную, пунктирную")
      question.answers.create(text: "2px, красную, сплошную")
      question.answers.create(text: "2px, синюю, двойную")
    question = test.questions.create(text: "Какое свойство для создания и управления колонками в многоколоночном тексте " +
                                     "позволяет изменить расстояние между ними?")
      question.answers.create(text: "margin")
      question.answers.create(text: "column-padding")
      question.answers.create(text: "column-margin")
      # question.answers.create(text: "padding")
      question.answers.create(text: "column-gap", correct: true)
    question = test.questions.create(text: "Какие значения может принимать opacity?")
      question.answers.create(text: "0-100", correct: true)
      question.answers.create(text: "0-50")
      question.answers.create(text: "0-10")
      question.answers.create(text: "0-1")

user1.tests << test
user2.tests << test

category = Category.create(title: "SQL")
  test     = category.tests.create(title: "SQL - Основы", level: 2, author_id: user1.id)
    question = test.questions.create(text: "Какое необязательное ключевое слово пропущено в выражении?<pre>INSERT TABLE name " +
                                     "(column1, column2) VALUES ('value1', 'value2')</pre>")
      question.answers.create(text: "OUT")
      question.answers.create(text: "IN")
      question.answers.create(text: "NAME")
      question.answers.create(text: "TO", correct: true)
   question = test.questions.create(text: "Какое представление имеет значение ноль для типа DATE?")
      question.answers.create(text: "00:00:00")
      question.answers.create(text: "0000")
      question.answers.create(text: "00-00-0000")
      # question.answers.create(text: "00-00-00")
      question.answers.create(text: "0000-00-00", correct: true)
    question = test.questions.create(text: "Перечислите все способы создания новой базы animals.")
      question.answers.create(text: "CREATE NEW DATABASE animals;")
      question.answers.create(text: "CREATE SCHEMA animals;")
      question.answers.create(text: "CREATE DATABASE IF NOT EXISTS;")
      # question.answers.create(text: "CREATE animals AS DATABASE;")
      question.answers.create(text: "CREATE DATABASE animals;", correct: true)

user2.tests << test
