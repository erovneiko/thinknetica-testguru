class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :text, presence: true
  validates :answers, length: { in: 0..4 }

  default_scope { order(:id) }
end
