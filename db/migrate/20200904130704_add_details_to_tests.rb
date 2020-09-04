class AddDetailsToTests < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :title, true
    change_column_null :tests, :level, true
    change_column_default :tests, :level, 0
  end
end
