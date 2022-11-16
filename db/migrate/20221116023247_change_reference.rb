class ChangeReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :meals, :user, foreign_key: true
    add_reference :meals, :seller, foreign_key: { to_table: :users }
  end
end
