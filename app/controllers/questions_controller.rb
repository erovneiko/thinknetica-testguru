class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show]
  rescue_from NoMethodError, with: :rescue_with_question_not_found

  def index
    render html: @test.questions.pluck(:text)
                      .map.with_index(1) { |s, i| i.to_s + '. ' + s }.join('\n\n')
                      .gsub('\n', '<br>').html_safe
  end

  def show
    render html: @test.questions[params[:id].to_i - 1]
                      .text.insert(0, params[:id] + '. ')
                      .gsub('\n', '<br>').html_safe
  end

  def create
    question = Question.create(text: params[:question][:text], test_id: params[:test_id])
    question.answers.build(text: 'dummy')
    question.save
    render plain: "Вопрос успешно создан!"
  end

  def destroy
    Question.find(params[:id]).destroy
    render plain: "Вопрос успешно удалён!"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найдён!'
  end
end
