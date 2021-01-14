class AwardsService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def awards
    awards = []

    Badge.all.each do |badge|
      awards << Award.new(badge: badge, test_passage: @test_passage) \
        if send("award_rule_#{badge.rule}?")
    end

    awards
  end

  private

  # 1. За успешное прохождение всех тестов в категории
  # 2. За успешное прохождение теста с первой попытки
  # 3. За успешное прохождение всех тестов лёгкого уровня
  # 4. За успешное прохождение первого трудного теста
  # 5. За успешное прохождение всех тестов

  def award_rule_1?
    category = @test_passage.test.category

    no_awards_in_category = @test_passage.user.awards.rule(1)
                                         .joins(test_passage: :test)
                                         .where(tests: { category_id: category })
                                         .empty?

    success_num_in_category = Test.joins(:test_passages)
                                  .where(category: category, test_passages: { success: true })
                                  .distinct
                                  .count

    total_tests_in_category = Test.where(category: category)
                                  .count

    no_awards_in_category && success_num_in_category == total_tests_in_category
  end

  def award_rule_2?
    # Других прохождений, кроме этого быть не должно
    @test_passage.test.test_passages
                 .where.not(id: @test_passage.id)
                 .empty?
  end

  def award_rule_3?
    success_num_easy = Test.joins(:test_passages)
                           .where(level: Test::LEVELS[:easy], test_passages: { success: true })
                           .distinct.count

    total_num_easy = Test.where(level: Test::LEVELS[:easy])
                         .count

    @test_passage.test.level == Test::LEVELS[:easy] &&
      success_num_easy == total_num_easy
  end

  def award_rule_4?
    no_awards_rule_4 = @test_passage.user.awards.rule(4).empty?

    @test_passage.test.level == Test::LEVELS[:advanced] && no_awards_rule_4
  end

  def award_rule_5?
    no_awards_rule_5 = @test_passage.user.awards.rule(5).empty?

    success_tests = Test.joins(:test_passages)
                        .where(test_passages: { success: true })
                        .distinct.count

    no_awards_rule_5 && success_tests == Test.count
  end
end
