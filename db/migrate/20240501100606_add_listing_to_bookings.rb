class AddListingToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :listing, null: false, foreign_key: true
  end
end
