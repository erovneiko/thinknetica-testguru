class DropUserTests < ActiveRecord::Migration[6.0]
  def up
    drop_table :user_tests
  end
end
