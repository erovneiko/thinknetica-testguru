class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true

  def tests_by_level(level)
    Test.by_user_level(id, level)
  end  
end
