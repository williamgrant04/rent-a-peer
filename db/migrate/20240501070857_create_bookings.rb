class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user_service, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true # Seller ID
      t.string :title
      t.text :description
      t.float :hourly_rate

      t.timestamps
    end
  end
end
