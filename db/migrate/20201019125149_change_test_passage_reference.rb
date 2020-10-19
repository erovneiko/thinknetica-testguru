class ChangeTestPassageReference < ActiveRecord::Migration[6.0]
  def change
    change_table :test_passages do |t|
      t.remove_references(:current_question)
      t.references :current_question, foreign_key: {to_table: :questions}
    end
  end
end
