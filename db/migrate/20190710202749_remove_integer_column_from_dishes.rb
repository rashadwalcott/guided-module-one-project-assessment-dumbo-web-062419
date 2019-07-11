class RemoveIntegerColumnFromDishes < ActiveRecord::Migration[5.2]
  def change
    remove_column :dishes, :integer, :integer
  end
end
