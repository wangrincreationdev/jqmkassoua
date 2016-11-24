class AddCategoryIdToAnnounces < ActiveRecord::Migration[5.0]
  def change
    add_column :announces, :category_id, :integer
  end
end
