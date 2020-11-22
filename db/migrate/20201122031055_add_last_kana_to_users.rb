class AddLastKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_kana, :string
  end
end
