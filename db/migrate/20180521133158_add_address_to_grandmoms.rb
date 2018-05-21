class AddAddressToGrandmoms < ActiveRecord::Migration[5.2]
  def change
    add_column :grandmoms, :address, :string
  end
end
