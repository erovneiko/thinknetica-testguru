class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

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
    render html: @question.text.gsub("<pre>", "\n<pre>\n")
                               .gsub("</pre>", "\n</pre>")
                               .html_safe
  end

  def create
    if @test.questions.new(question_params).save
      redirect_to test_questions_path
    else
      redirect_to new_test_question_path(invalid: true)
    end
  end

  def destroy
    @question.destroy
    render plain: "Вопрос успешно удалён!\n"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message + "!\n"
  end
end
