class AddPostalCodeToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :postal_code, :string
  end
end
