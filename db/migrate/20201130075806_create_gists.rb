class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists, id: false do |t|
      t.string :id, null: false, primary_key: true
      t.integer :question_id, null: false, index: true
      t.integer :user_id, null: false, index: true

      t.timestamps
    end
  end
end
