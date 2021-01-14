class TestsController < ApplicationController
  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.questions.none?
      redirect_to tests_path, alert: t('.no_questions')
      return
    end

    current_user.tests << @test
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
