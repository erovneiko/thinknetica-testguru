class QuestionsController < ApplicationController
  before_action :find_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_question_invalid
  rescue_from NoMethodError, with: :rescue_with_question_not_found

  def index
    render html: @test.questions.pluck(:text)
                      .map.with_index(1) { |s, i| i.to_s + '. ' + s }
                      .join("\n<br><br>\n")
                      .gsub("<pre>", "\n<pre>\n")
                      .gsub("</pre>", "\n</pre>")
                      .gsub("</pre>\n<br><br>", "</pre>")
                      .html_safe
  end

  def show
    question = if !params[:test_id].nil?
                 @test.questions[params[:id].to_i - 1]
               else
                 Question.find(params[:id])
               end
    render html: question.text.insert(0, params[:id] + '. ')
                         .gsub("<pre>", "\n<pre>\n")
                         .gsub("</pre>", "\n</pre>")
                         .html_safe
  end

  def create
    @test.questions.create!(question_params)
    redirect_to test_questions_path
  end

  def destroy
    if !params[:test_id].nil?
      @test.questions[params[:id].to_i - 1].destroy
    else
      Question.find(params[:id]).destroy
    end
    render plain: "Вопрос успешно удалён!\n"
  end

  private

  def find_test
    @test = Test.find(params[:test_id]) unless params[:test_id].nil?
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message + "!\n"
  end

  def rescue_with_question_not_found
    render plain: "Вопрос не найдён!\n"
  end

  def rescue_with_question_invalid
    render plain: "Введённые данные некорректны!\n"
  end
end
