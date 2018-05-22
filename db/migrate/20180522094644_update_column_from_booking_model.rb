class UpdateColumnFromBookingModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :start_time, :datetime
    remove_column :bookings, :end_time, :datetime
    add_column :bookings, :start_time, :date
    add_column :bookings, :end_time, :date
  end

end
