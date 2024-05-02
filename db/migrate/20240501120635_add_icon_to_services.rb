class AddIconToServices < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :icon, :string
  end
end
