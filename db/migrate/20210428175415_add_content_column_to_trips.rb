class AddContentColumnToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :content, :string
  end
end
