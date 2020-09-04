class AddDetailsToTests < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tests, :title, true
    change_column_null :tests, :level, true
  end
end
