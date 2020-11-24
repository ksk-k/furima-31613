class AddFirstKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_kana, :string
  end
end
