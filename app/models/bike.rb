class Bike < ActiveRecord::Base
  has_many :trips, foreign_key: 'city_bike_id', primary_key: 'city_bike_id'
  has_many :start_stations, through: :trips # do we need to add start/end stations
  has_many :end_stations, through: :trips
end
