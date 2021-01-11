class AddSuccessToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :success, :boolean, default: false
    add_index :test_passages, %i[test_id success]
  end
end
