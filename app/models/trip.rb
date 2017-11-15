class Trip < ActiveRecord::Base
  belongs_to :start_station, class_name: 'Station', foreign_key: 'start_station_id', primary_key:'city_station_id'
  belongs_to :end_station, class_name: 'Station', foreign_key: 'end_station_id', primary_key: 'city_station_id'
  belongs_to :bike, foreign_key: 'city_bike_id', primary_key: 'city_bike_id'
end
