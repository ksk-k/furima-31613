class AddMunicipalityToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :municipality, :string
  end
end
