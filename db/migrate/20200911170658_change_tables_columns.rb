class ChangeTablesColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :text, false
    change_column_null :categories, :title, false
    change_column_null :questions, :text, false
    change_column_null :tests, :title, false
    change_column_null :tests, :level, false
    add_reference :tests, :author, null: false, foreign_key: {to_table: :users}
    change_column_null :users, :name, false
  end
end
