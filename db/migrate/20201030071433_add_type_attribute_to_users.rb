class AddTypeAttributeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User', index: true
  end
end
