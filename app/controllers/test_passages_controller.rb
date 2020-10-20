class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show
    @index = @test.questions.index(@test_passage.current_question) + 1
    @total = @test.questions.count
  end

  def result
    @result = @test_passage.correct_questions * 100 / @test.questions.count
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      show
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
    @test = @test_passage.test
  end
end
