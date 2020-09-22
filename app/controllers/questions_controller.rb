class QuestionsController < ApplicationController
  def index
    render html: Test.find(params[:test_id]).questions.pluck(:text)
                     .map.with_index(1) { |s, i| i.to_s + '. ' + s }.join('\n\n')
                     .gsub('\n', '<br>').html_safe
  end

  def show
    render html: Test.find(params[:test_id]).questions[params[:id].to_i - 1]
                     .text.insert(0, params[:id] + '. ')
                     .gsub('\n', '<br>').html_safe
  end

  def create
    question = Question.create(text: params[:question][:text], test_id: params[:test_id])
    question.answers.build(text: 'dummy')
    question.save
    render plain: "Вопрос успешно создан!"
  end
end
