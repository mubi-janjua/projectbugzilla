class AddUserToProjectt < ActiveRecord::Migration[5.2]
  def change
    add_reference :projectts, :user, foreign_key: true
  end
end
