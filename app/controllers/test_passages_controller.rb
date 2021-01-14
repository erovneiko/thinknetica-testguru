class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    if @test_passage.current_question.nil?
      redirect_to result_test_passage_path(@test_passage)
      return
    end

    if @test.timer.positive?
      @timer_seconds = (@test_passage.created_at + @test.timer * 60 - Time.now).to_i
      if @timer_seconds <= 0
        redirect_to result_test_passage_path(@test_passage)
        return
      end
    end

    @index = @test.questions.index(@test_passage.current_question) + 1
    @total = @test.questions.count
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      if @test_passage.success?
        current_user.awards << AwardsService.new(@test_passage).awards
      end

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to @test_passage
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question, OctokitClient.new).call

    flash_options =
      if result.success?
        gist_data = JSON.parse(result.body, symbolize_names: true)

        Gist.create do |g|
          g.id = gist_data[:id]
          g.question = @test_passage.current_question
          g.user = current_user
        end

        { notice: t('.success', gist_url: helpers.link_to('Gist', gist_data[:html_url], class: 'alert-link')) }
      else
        { alert: t('.failure') }
      end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
    @test         = @test_passage.test
  end
end
