class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.references :restaurant, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
