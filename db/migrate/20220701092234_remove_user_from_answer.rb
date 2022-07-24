class RemoveUserFromAnswer < ActiveRecord::Migration[6.1]
  def change
    remove_column(:answers, :user_id)
  end
end
