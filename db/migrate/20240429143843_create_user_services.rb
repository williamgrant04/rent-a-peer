class CreateUserServices < ActiveRecord::Migration[7.1]
  def change
    create_table :user_services do |t|
      t.references :users, null: false, foreign_key: true
      t.references :services, null: false, foreign_key: true

      t.timestamps
    end
  end
end
