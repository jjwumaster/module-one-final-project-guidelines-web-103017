class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :duration
      t.datetime :start_time
      t.datetime :end_time
      t.integer :start_station_id
      t.integer :end_station_id
      t.integer :city_bike_id
      t.string :user_type
      t.integer :birth_year
      t.integer :gender
    end
  end
end
