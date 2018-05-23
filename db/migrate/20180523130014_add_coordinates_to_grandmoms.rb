class AddCoordinatesToGrandmoms < ActiveRecord::Migration[5.2]
  def change
    add_column :grandmoms, :latitude, :float
    add_column :grandmoms, :longitude, :float
  end
end
