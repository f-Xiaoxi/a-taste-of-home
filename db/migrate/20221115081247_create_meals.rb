class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.text :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
