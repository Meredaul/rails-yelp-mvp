class ChangeAddressColumnTypeOfRestaurantToString < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :address, :string
  end
end
