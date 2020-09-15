class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  def get_tests(level)
    Test.where(level: level)
    .joins('JOIN user_tests ON user_tests.test_id = tests.id')
    .where("user_tests.user_id = ?", id)
  end
end
