class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :hash, presence: true
end
