class ChangeDishesSize < ActiveRecord::Migration[5.2]
  def down
    change_column :dishes, :size, :string
  end
end
