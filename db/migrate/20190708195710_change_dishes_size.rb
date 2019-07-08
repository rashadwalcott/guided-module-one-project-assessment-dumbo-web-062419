class ChangeDishesSize < ActiveRecord::Migration[5.2]
  def change
    change_column :dishes, :size, :string
  end
end
