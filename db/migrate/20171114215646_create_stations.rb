class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.integer :city_station_id
      t.string :name
      t.float :latitude
      t.float :longitude
    end
  end
end
