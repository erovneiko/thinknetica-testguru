class Award < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  belongs_to :test_passage

  scope :rule, ->(rule) { joins(:badge).where(badges: { rule: rule }) }
end
