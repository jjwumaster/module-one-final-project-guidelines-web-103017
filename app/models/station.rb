class Station < ActiveRecord::Base
  # has_many :trips, foreign_key: 'start_station_id', primary_key: 'city_station_id'
  # has_many :trips, foreign_key: 'end_station_id', primary_key: 'city_station_id'

  has_many :trips, foreign_key: 'start_station_id', primary_key: 'city_station_id'
  has_many :bikes, through: :trips
end
