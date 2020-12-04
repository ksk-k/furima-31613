class AddBuildingNameToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :building_name, :string
  end
end
