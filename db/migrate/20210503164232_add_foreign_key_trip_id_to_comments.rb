class AddForeignKeyTripIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :trip_id, :integer
  end
end
