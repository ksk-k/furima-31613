class AddOrderIdToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :order_id, :integer
  end
end
