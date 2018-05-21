class CreateGrandmoms < ActiveRecord::Migration[5.2]
  def change
    create_table :grandmoms do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo
      t.string :description
      t.integer :price
      t.boolean :cooking
      t.boolean :childcare
      t.boolean :storytelling
      t.boolean :goforawalk

      t.timestamps
    end
  end
end
