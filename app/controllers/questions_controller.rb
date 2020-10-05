class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update destroy]
  before_action :find_test_by_question, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @questions = @test.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to test_questions_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test_by_question
    @test = @question.test
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_record_not_found(exception)
    render plain: exception.message + "!\n"
  end
end
