class User < ApplicationRecord
  def get_tests(level)
    Test.where(level: level)
    .joins('JOIN user_tests ON user_tests.test_id = tests.id')
    .joins('JOIN users ON users.id = user_tests.user_id')
    .where("user_tests.user_id = ?", id)
  end
end
