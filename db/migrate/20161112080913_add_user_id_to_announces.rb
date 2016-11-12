class AddUserIdToAnnounces < ActiveRecord::Migration[5.0]
  def change
    add_column :announces, :user_id, :integer
  end
end
