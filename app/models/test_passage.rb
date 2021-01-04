class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  has_many :awards
  has_many :award_badges, through: :awards, source: :badge

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  SUCCESS_PERCENTAGE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def result
    correct_questions * 100 / test.questions.count
  end

  def success?
    result >= SUCCESS_PERCENTAGE
  end

  def award?(rule)
    case rule
    when 1 then award_rule_1?
    when 2 then award_rule_2?
    when 3 then award_rule_3?
    when 4 then award_rule_4?
    when 5 then award_rule_5?
    else
      raise "Badge rule #{rule} is not supported"
    end
  end

  def awards
    awards = []

    Badge.all.each do |badge|
      awards << Award.new(badge: badge, test_passage: self) if award?(badge.rule)
    end

    awards
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) \
      && (correct_answers_count == answer_ids.count)
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  # За успешное прохождение всех тестов из категории
  # За успешное прохождение теста с первой попытки
  # За успешное прохождение всех тестов лёгкого уровня
  # За успешное прохождение первого трудного теста
  # За успешное прохождение всех тестов

  def award_rule_1?
    # Награда выдаётся только один раз за категорию
    user.awards.each do |award|
      return false if award.test_passage.test.category == test.category
    end

    test.category.tests.each do |test|
      return false unless test.at_least_one_success?
    end

    true
  end

  def award_rule_2?
    # Других прохождений, кроме этого быть не должно
    return false unless test.test_passages.where.not(id: id).empty?

    success?
  end

  def award_rule_3?
    easy_level = ApplicationController.helpers.test_levels_key(:easy)

    return false unless test.level == easy_level

    Test.where(level: easy_level).each do |test|
      return false unless test.at_least_one_success?
    end

    true
  end

  def award_rule_4?
    # Награда выдаётся только один раз
    return false unless user.awards.joins(:badge).where(badges: {rule: 4}).empty?

    test.level == ApplicationController.helpers.test_levels_key(:advanced) && success?
  end

  def award_rule_5?
    Test.all.each do |test|
      return false unless test.at_least_one_success?
    end

    true
  end
end
