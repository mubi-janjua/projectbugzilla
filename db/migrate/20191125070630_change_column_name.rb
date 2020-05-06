class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bugs, :type, :typed
  end
end
