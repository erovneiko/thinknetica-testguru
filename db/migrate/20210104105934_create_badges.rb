class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :url, null: false
      t.integer :rule, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
