class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :meal, foreign_key: true
      t.string :status, null: false
      t.string :comment

      t.timestamps
    end
  end
end
