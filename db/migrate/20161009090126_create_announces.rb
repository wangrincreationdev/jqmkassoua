class CreateAnnounces < ActiveRecord::Migration[5.0]
  def change
    create_table :announces do |t|
      t.string :nom
      t.text :description
      t.integer :prix

      t.timestamps
    end
  end
end
