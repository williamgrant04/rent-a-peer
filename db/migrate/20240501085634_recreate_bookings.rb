class RecreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      # t.references :listing, null: false, foreign_key: true # We will have to add this later when Brad is done with listings
      t.references :user, null: false, foreign_key: true # Buyer ID
      t.date :start_date
      t.date :end_date
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
