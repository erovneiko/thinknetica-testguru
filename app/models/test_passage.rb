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
    success
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = next_question
    self.success = (result >= SUCCESS_PERCENTAGE) if completed?
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
end
