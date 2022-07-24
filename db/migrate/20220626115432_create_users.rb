class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 10
      t.string :password, limit: 10

      t.timestamps
    end
  end
end
