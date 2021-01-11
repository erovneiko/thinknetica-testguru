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

  # Награда выдаётся только один раз за категорию
  # Количество успешных тестов должно равняться общему количеству тестов в категории
  def award_rule_1?
    category = @test_passage.test.category

    @test_passage.user.awards.rule(1)
                 .joins(test_passage: :test)
                 .where(tests: { category_id: category })
                 .empty? &&
      Test.joins(:test_passages)
          .where(category: category, test_passages: { success: true })
          .distinct
          .count ==
        Test.where(category: category)
            .count
  end

  # Других прохождений, кроме этого быть не должно
  def award_rule_2?
    @test_passage.test.test_passages
                 .where.not(id: @test_passage.id)
                 .empty?
  end

  # Завершённый тест должен быть лёгким
  # Количество успешных лёгких тестов должно равняться общему количеству лёгких тестов
  def award_rule_3?
    @test_passage.test.level == Test::LEVELS[:easy] &&
      Test.joins(:test_passages)
          .where(level: Test::LEVELS[:easy], test_passages: { success: true })
          .distinct.count ==
        Test.where(level: Test::LEVELS[:easy])
            .count
  end

  # Завершённый тест должен быть трудный
  # Награда выдаётся только один раз
  def award_rule_4?
    @test_passage.test.level == Test::LEVELS[:advanced] &&
      @test_passage.user.awards.rule(4).empty?
  end

  # Награда выдаётся только один раз
  # Количество успешных тестов должно равняться общему количеству тестов
  def award_rule_5?
    @test_passage.user.awards.rule(5).empty? &&
      Test.joins(:test_passages)
          .where(test_passages: { success: true })
          .distinct.count ==
        Test.count
  end
end
