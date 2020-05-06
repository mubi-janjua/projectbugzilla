class CreateProjectts < ActiveRecord::Migration[5.2]
  def change
    create_table :projectts do |t|
      t.string :name

      t.timestamps
    end
  end
end
