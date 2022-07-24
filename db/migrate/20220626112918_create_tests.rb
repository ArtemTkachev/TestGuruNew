class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.integer :level
      t.string :title, limit: 50
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
