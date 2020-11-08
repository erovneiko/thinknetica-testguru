class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :text, presence: true
  validate :answers_count

  def answers_count
    errors.add(:question, I18n.t('activerecord.attributes.answer.too_much')) if question.answers.count >= 4
  end
end
