class AddAverageRatingToUserServices < ActiveRecord::Migration[7.1]
  def change
    add_column :user_services, :average_rating, :float
  end
end
