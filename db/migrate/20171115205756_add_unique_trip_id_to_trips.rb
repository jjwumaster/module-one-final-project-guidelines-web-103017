class AddUniqueTripIdToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :unique_trip_id, :string
  end
end
