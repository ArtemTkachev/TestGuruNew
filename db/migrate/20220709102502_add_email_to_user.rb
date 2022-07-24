class AddEmailToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string,
               limit: 10, null: false
  end
end
