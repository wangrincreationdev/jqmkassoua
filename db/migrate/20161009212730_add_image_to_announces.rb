class AddImageToAnnounces < ActiveRecord::Migration[5.0]
  def change
    add_column :announces, :image, :string
  end
end
