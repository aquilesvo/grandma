class AddGrandmomToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :grandmom, foreign_key: true
  end
end
