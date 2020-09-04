class AddAnswersTextNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :answers, :text, true
    change_column_default :answers, :correct, false
  end
end
