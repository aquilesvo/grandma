class AddUserToGrandmom < ActiveRecord::Migration[5.2]
  def change
    add_reference :grandmoms, :user, foreign_key: true
  end
end
