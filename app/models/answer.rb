class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :text, presence: true
  validate :answers_count

  def answers_count
    errors.add(:question, "has too much answers") if question.answers.count >= 4
  end
end
