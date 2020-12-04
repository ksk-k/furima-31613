class AddPrefectureIdToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :prefecture_id, :integer
  end
end
