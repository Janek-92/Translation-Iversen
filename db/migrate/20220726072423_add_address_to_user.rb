class AddAddressToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Address, :string
  end
end
