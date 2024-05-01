class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.float :hourly_rate
      t.references :user_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
