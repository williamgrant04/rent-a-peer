class DropBookings < ActiveRecord::Migration[7.1]
  def change
    drop_table :bookings
  end
end
