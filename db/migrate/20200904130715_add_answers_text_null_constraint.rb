class AddAnswersTextNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :text, true
  end
end
