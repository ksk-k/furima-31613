class AddPhoneNumberToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :phone_number, :string
  end
end
