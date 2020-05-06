class AddUniqueIndexToProjectusers < ActiveRecord::Migration[5.2]
  def change
    add_index :projectusers, [:user_id, :projectt_id], unique: true
  end
end
