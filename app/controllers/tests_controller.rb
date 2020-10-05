class TestsController < ApplicationController
  before_action :find_test

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
