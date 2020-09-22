class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :text, presence: true
  validates :answers, length: { in: 1..4 }

  default_scope { order(:id) }
end
