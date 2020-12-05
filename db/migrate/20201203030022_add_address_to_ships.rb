class AddAddressToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :address, :string
  end
end
